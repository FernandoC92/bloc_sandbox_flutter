import 'package:bloc_sandbox/bloc/ex2/ex2.form_submission_status.dart';

class Ex2LoginState {
  final String username;
  bool get isValidusername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final Ex2FormSubmissionStatus formStatus;

  Ex2LoginState(
      {this.username = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  Ex2LoginState copyWith(
      {String? username,
      String? password,
      Ex2FormSubmissionStatus? formStatus}) {
    return Ex2LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
