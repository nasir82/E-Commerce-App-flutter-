class FirebaseExceptionsCustom implements Exception {
  final String code;
  FirebaseExceptionsCustom(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use. Please try with different one';
      case 'email-already-exists':
        return 'The email address is already exist. Please try with different one';
      case 'invalid-email':
        return 'The email address entered is invalid. Please enter a valid one';
      case 'weak-password':
        return 'Plase enter a strong password';
      case 'user-disabled':
        return 'This user account has been disabled';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again';
      case 'invalid-credential':
        return 'Incorrect email or password. Please check your email and password';
      case 'invalid-verification-code':
        return 'Invalid varification code. Please enter a valid code';
      case 'invalid-verification-id':
        return 'Invalid varification id. Please request a new verification code';
      case 'qouta-exceeded':
        return 'Qouta exceeded please try again laiter';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential. Please use another method';
      case 'network-request-failed':
        return 'A network error occurred. Please check your internet connection';
      case 'too-many-requests':
        return 'Too many requests. Please try again later';
      case 'user-token-expired':
        return 'Your session has expired. Please sign in again';
      case 'invalid-phone-number':
        return 'The phone number entered is invalid. Please enter a valid number';
      case 'credential-already-in-use':
        return 'This credential is already associated with another account';
      case 'timeout':
        return 'The request timed out. Please try again later';
      case 'unknown':
        return 'An unknown error occurred. Please try again later';
      case 'invalid-api-key':
        return 'The API key is invalid. Please check your configuration';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new one';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again';
      case 'user-mismatch':
        return 'The user credential does not match the one provided';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please log in again';
      case 'session-cookie-expired':
        return 'The session cookie has expired. Please log in again';
      case 'invalid-session-cookie':
        return 'The session cookie is invalid. Please log in again';
      case 'missing-email':
        return 'The email address is missing. Please provide an email address';
      case 'missing-android-pkg-name':
        return 'The Android package name is missing. Please provide it for the request';
      case 'missing-continue-uri':
        return 'The continue URL is missing. Please provide it for the request';
      case 'missing-ios-bundle-id':
        return 'The iOS bundle ID is missing. Please provide it for the request';
      case 'invalid-continue-uri':
        return 'The continue URL provided is invalid. Please check the URL and try again';
      case 'unauthorized-continue-uri':
        return 'The domain in the continue URL is not whitelisted. Please check the configuration';
      case 'missing-phone-number':
        return 'The phone number is missing. Please provide a valid phone number';
      case 'invalid-recipient-email':
        return 'The recipient email is invalid. Please provide a valid email address';
      case 'invalid-sender':
        return 'The email address of the sender is invalid. Please provide a valid sender email address';
      case 'invalid-message-payload':
        return 'The email message payload is invalid. Please check the payload and try again';
      case 'invalid-oauth-client-id':
        return 'The OAuth client ID provided is invalid. Please check the configuration';
      case 'invalid-oauth-provider':
        return 'The OAuth provider provided is invalid. Please check the configuration';
      default:
        return 'An unexpected firebase error occurred. Please try again';
    }
  }
}
