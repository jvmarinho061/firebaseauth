import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginflutterteste/features/data/auth_firebase_datarsource.dart';
import 'package:loginflutterteste/features/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final AuthFirebaseDatarsource _authFirebaseDatarsource;

  AuthRepositoryImpl(
  this._firebaseAuth, 
  this._authFirebaseDatarsource
  );

  @override
  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  @override
  Future<Map<String, dynamic>> getUserProfile() {
    return _authFirebaseDatarsource.getUserProfile();
  }
  
  @override
  Future<void> register(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      );
  }
}
