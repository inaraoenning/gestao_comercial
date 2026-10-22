class notFoundException implements Exception {
  final String message;

  notFoundException(this.message);

  @override
  String toString() => message;
}
