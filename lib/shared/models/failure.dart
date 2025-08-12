class Failure {
  int? code;
  String? message;
  dynamic error;

  Failure({this.code = 0, this.message = 'Something went wrong', this.error});

  Failure.dio(dynamic e) {
    code = e.response?.statusCode;
    message = e.response?.data['message'];
    error = e;
  }
}
