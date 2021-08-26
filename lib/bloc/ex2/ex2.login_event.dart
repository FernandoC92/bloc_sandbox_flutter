abstract class Ex2LoginEvent {}

class LoginUsernameChanged extends Ex2LoginEvent {
  final String? username;

  LoginUsernameChanged({this.username});
}

class LoginPasswordChanged extends Ex2LoginEvent {
  final String? password;

  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends Ex2LoginEvent {}
