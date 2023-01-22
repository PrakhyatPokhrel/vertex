String? validatePhone(String? value) {
  if (value!.length != 10) {
    return "Phone number must be 10 characters";
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "Please enter a password";
  } else if (value.length < 6) {
    return "Password must be greater than 6 characters";
  }
  return null;
}

String? validateField(String? value) {
  if (value!.isEmpty) {
    return "Please fill the required field";
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}
