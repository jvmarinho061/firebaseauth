import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginflutterteste/features/auth/auth_event.dart';
import 'package:loginflutterteste/features/auth/auth_state.dart';
import 'package:loginflutterteste/features/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
  }

  Future<void> _onLogin(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await repository.login(event.email, event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
