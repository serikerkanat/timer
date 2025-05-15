import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'storage_service.dart';
import 'connectivity_service.dart';

class SyncService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageService _storage;
  final ConnectivityService _connectivity;

  SyncService(this._storage, this._connectivity);

  Future<void> syncData() async {
    if (!_connectivity.isOnline) {
      throw Exception('No internet connection available');
    }

    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    // Sync timers
    await _syncTimers(user.uid);

    // Sync preferences
    await _syncPreferences(user.uid);

    // Update last sync time
    await _storage.updateLastSync();
  }

  Future<void> _syncTimers(String userId) async {
    // Get local timers
    final localTimers = _storage.getTimers();

    // Get remote timers
    final remoteSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('timers')
        .get();

    final remoteTimers = remoteSnapshot.docs
        .map((doc) => doc.data())
        .toList();

    // Merge timers (local takes precedence for conflicts)
    final mergedTimers = _mergeTimers(localTimers, remoteTimers);

    // Update local storage
    await _storage.saveTimers(mergedTimers);

    // Update remote storage
    final batch = _firestore.batch();
    for (final timer in mergedTimers) {
      final docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('timers')
          .doc(timer['id'] as String);
      batch.set(docRef, timer);
    }
    await batch.commit();
  }

  List<Map<String, dynamic>> _mergeTimers(
    List<Map<String, dynamic>> local,
    List<Map<String, dynamic>> remote,
  ) {
    final Map<String, Map<String, dynamic>> merged = {};

    // Add remote timers
    for (final timer in remote) {
      merged[timer['id'] as String] = timer;
    }

    // Add/update with local timers
    for (final timer in local) {
      merged[timer['id'] as String] = timer;
    }

    return merged.values.toList();
  }

  Future<void> _syncPreferences(String userId) async {
    // Get local preferences
    final localPrefs = _storage.getPreferences();

    // Get remote preferences
    final remoteDoc = await _firestore
        .collection('users')
        .doc(userId)
        .get();

    final remotePrefs = remoteDoc.data();

    // Merge preferences (local takes precedence)
    final mergedPrefs = {
      ...?remotePrefs,
      ...?localPrefs,
    };

    // Update local storage
    await _storage.savePreferences(mergedPrefs);

    // Update remote storage
    await _firestore
        .collection('users')
        .doc(userId)
        .set(mergedPrefs, SetOptions(merge: true));
  }

  Future<void> enableOfflineMode(String pin) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    // Save current user data locally
    await _storage.saveUserData({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
    });

    // Set offline PIN
    await _storage.setOfflinePin(pin);

    // Sync current data
    await syncData();
  }
} 