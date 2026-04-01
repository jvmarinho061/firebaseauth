abstract class AuthEvent {}
class LoadUserProfile extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  RegisterRequested(this.email, this.password);
}

class CheckAuthStatus extends AuthEvent {}
