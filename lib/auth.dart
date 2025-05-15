import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled.';
          break;
        default:
          message = 'An error occurred during sign in.';
      }
      throw AuthException(message);
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  // Register with email and password
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Create a new document for the user in Firestore
      await _firestore.collection('users').doc(result.user!.uid).set({
        'email': email,
        'theme': 'system',
        'language': 'en',
      });
      return result.user;
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'An account already exists for this email.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        default:
          message = 'An error occurred during registration.';
      }
      throw AuthException(message);
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      throw AuthException('Failed to sign out.');
    }
  }

  // Get user preferences
  Future<Map<String, dynamic>> getUserPreferences(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      return doc.data() as Map<String, dynamic>;
    } catch (e) {
      throw AuthException('Failed to get user preferences.');
    }
  }

  // Update user preferences
  Future updateUserPreferences(String uid, String theme, String language) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'theme': theme,
        'language': language,
      });
    } catch (e) {
      throw AuthException('Failed to update user preferences.');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  
  @override
  String toString() => message;
}