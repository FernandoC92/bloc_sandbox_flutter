import 'package:bloc_sandbox/blocs/ex2/ex2.form_submission_status.dart';
import 'package:bloc_sandbox/blocs/ex2/ex2.login_event.dart';
import 'package:bloc_sandbox/blocs/ex2/ex2.login_state.dart';
import 'package:bloc_sandbox/repositories/ex2.auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ex2LoginBloc extends Bloc<Ex2LoginEvent, Ex2LoginState> {
  final AuthRepository? authRepo;

  // * super and state
  Ex2LoginBloc({this.authRepo}) : super(Ex2LoginState());

  @override
  Stream<Ex2LoginState> mapEventToState(Ex2LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo?.login();
        yield state.copyWith(formStatus: SubmissionSucess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
