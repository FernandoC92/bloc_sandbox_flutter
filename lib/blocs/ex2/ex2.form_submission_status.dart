abstract class Ex2FormSubmissionStatus {
  const Ex2FormSubmissionStatus();
}

class InitialFormStatus extends Ex2FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends Ex2FormSubmissionStatus {}

class SubmissionSucess extends Ex2FormSubmissionStatus {}

class SubmissionFailed extends Ex2FormSubmissionStatus {
  final exception;
  SubmissionFailed(this.exception);
}
