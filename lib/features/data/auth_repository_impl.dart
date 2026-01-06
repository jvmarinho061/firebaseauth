import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginflutterteste/features/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final AuthFirebaseDatarsource;

  AuthRepositoryImpl(this._firebaseAuth, 
  this.AuthFirebaseDatarsource
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
    return AuthFirebaseDatarsource.getUserProfile();
  }
}
