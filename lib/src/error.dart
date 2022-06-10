class Error {
  final int error;

  Error.convert(this.error);

  Error._(this.error);

  static final Error NO_ERROR = Error._(0);

  @override
  bool operator ==(Object other) {
    if (other is int) {
      return error == other;
    } else {
      return other is Error && other.error == error;
    }
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() {
    return 'Error{error: $error}';
  }
}
