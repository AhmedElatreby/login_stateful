class ValidationMixin {
  String? emailValidator(String? value) {
    if (!value!.contains('@')) {
      return 'Please Enter a valid email';
    }
    return null;

  }

  String? passwordValidation(value) {
    if (value!.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
