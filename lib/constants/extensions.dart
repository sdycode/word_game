extension ValidateAlphabet on String {
  bool isValidAlphabet() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this.trim());
  }
}
