extension EmailValidation on String {
  bool isEmailValidation() {
    return REGEXEMAIL.hasMatch(this);
  }
}

extension NumberValidation on String {
  bool isNumberValidation() {
    return REGEXP_NUMBER_ONLY.hasMatch(this);
  }
}

// ignore: non_constant_identifier_names
RegExp REGEXP_NUMBER_ONLY = RegExp('[a-zA-Z]');
// ignore: non_constant_identifier_names
RegExp REGEXEMAIL = RegExp(r'[!#<$%*()_+={}":|\/^>,?]');
