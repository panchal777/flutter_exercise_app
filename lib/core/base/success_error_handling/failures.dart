abstract class Failure {}

class ServerFailure extends Failure {
  String message = "";
  int? statusCode;

  ServerFailure(this.message, this.statusCode);
}

class GeneralFailure extends Failure {
  String message = "";
  int? statusCode;

  GeneralFailure(this.message, this.statusCode);
}

class FailureMessage extends Failure {
  String message;

  FailureMessage(this.message);
}
