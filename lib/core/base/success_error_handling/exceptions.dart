class ServerException implements Exception {
  final String? message;
  final int? statusCode;

  ServerException(this.statusCode, this.message);
}

class GeneralException implements Exception {
  final String? message;
  final int? statusCode;

  GeneralException(this.statusCode, this.message);
}

