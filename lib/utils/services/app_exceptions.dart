class AppExceptions implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;
  AppExceptions([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppExceptions {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
