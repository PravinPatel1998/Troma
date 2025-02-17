extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
        .hasMatch(this);
  }

  bool isValidateEmpty() {
    if (isEmpty || length == 0 || this == "") {
      return false;
    }
    return true;
  }

  bool isValidatePassword() {
    if (length <= 6) {
      return false;
    }
    return true;
  }

  bool isValidatePhone() {
    if (length < 10) {
      return false;
    }
    return true;
  }
}
