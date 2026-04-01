import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/auth/auth_event.dart';
import 'package:loginflutterteste/features/auth/auth_state.dart';
import 'package:loginflutterteste/features/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<CheckAuthStatus>(_onCheckAuth);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await repository.login(event.email, event.password);
      final user = FirebaseAuth.instance.currentUser!;
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onRegister(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await repository.register(event.email, event.password);
      final user = FirebaseAuth.instance.currentUser!;
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

Future<void> _onCheckAuth(
  CheckAuthStatus event,
  Emitter<AuthState> emit,
) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    emit(Authenticated(user));
  } else {
    final message = FirebaseAuthException; 
    emit(AuthFailure(message.toString()));
  }
}
