import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class StorageService {
  static const String userBoxName = 'userBox';
  static const String timersBoxName = 'timersBox';
  static const String preferencesBoxName = 'preferencesBox';
  static const String _offlinePinKey = 'offlinePin';
  static const String _lastSyncKey = 'lastSync';
  
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  late Box _userBox;
  late Box _timersBox;
  late Box _preferencesBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox(userBoxName);
    _timersBox = await Hive.openBox(timersBoxName);
    _preferencesBox = await Hive.openBox(preferencesBoxName);
  }

  // User data methods
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _userBox.put('userData', userData);
  }

  Map<String, dynamic>? getUserData() {
    return _userBox.get('userData') as Map<String, dynamic>?;
  }

  // Timer data methods
  Future<void> saveTimers(List<Map<String, dynamic>> timers) async {
    await _timersBox.put('timers', timers);
    await updateLastSync();
  }

  List<Map<String, dynamic>> getTimers() {
    final timers = _timersBox.get('timers');
    return timers != null ? List<Map<String, dynamic>>.from(timers) : [];
  }

  // Preferences methods
  Future<void> savePreferences(Map<String, dynamic> preferences) async {
    await _preferencesBox.put('preferences', preferences);
  }

  Map<String, dynamic>? getPreferences() {
    return _preferencesBox.get('preferences') as Map<String, dynamic>?;
  }

  // Offline PIN methods
  Future<void> setOfflinePin(String pin) async {
    final hashedPin = _hashPin(pin);
    await _secureStorage.write(key: _offlinePinKey, value: hashedPin);
  }

  Future<bool> verifyOfflinePin(String pin) async {
    final storedHash = await _secureStorage.read(key: _offlinePinKey);
    if (storedHash == null) return false;
    
    final inputHash = _hashPin(pin);
    return storedHash == inputHash;
  }

  String _hashPin(String pin) {
    final bytes = utf8.encode(pin);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  // Sync methods
  Future<void> updateLastSync() async {
    await _preferencesBox.put(_lastSyncKey, DateTime.now().toIso8601String());
  }

  DateTime? getLastSync() {
    final lastSync = _preferencesBox.get(_lastSyncKey) as String?;
    return lastSync != null ? DateTime.parse(lastSync) : null;
  }

  // Clear all data
  Future<void> clearAll() async {
    await _userBox.clear();
    await _timersBox.clear();
    await _preferencesBox.clear();
    await _secureStorage.delete(key: _offlinePinKey);
  }
} 