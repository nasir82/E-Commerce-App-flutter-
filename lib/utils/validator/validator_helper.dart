class ValidatorHelper {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required.";
    }
    final emailExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailExp.hasMatch(value)) {
      return "Invalid email address.";
    }

    return null;
  }

  static String? validateEmptyString(String? fieldName,String? value){
    if(value == null || value.isEmpty) return "$fieldName is required";
    return null;
  }

  static String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "password required.";
    }

    if (value.length < 6) {
      return "Password must be at least 6 character.";
    }
    return null;
  }

  static String? validatorPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "phone number required.";
    }

    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number 10 digit require";
    }
    return null;
  }
}
