class AppValidators {
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final regex = RegExp(r'^\+?\d{10,15}$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    final regex = RegExp(r'^[a-zA-Z0-9_]{3,15}$');
    if (!regex.hasMatch(value)) {
      return '3–15 chars, letters, numbers or _';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Name can contain only letters';
    }
    return null;
  }

  static String? dateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is required';
    }
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regex.hasMatch(value)) {
      return 'Use format YYYY-MM-DD';
    }
    return null;
  }

  static String? url(String? value) {
    if (value == null || value.isEmpty) return null; // optional field
    final regex = RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid URL';
    }
    return null;
  }

  static String? creditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required';
    }
    final regex = RegExp(r'^\d{16}$');
    if (!regex.hasMatch(value)) {
      return 'Card must be 16 digits';
    }
    return null;
  }

  static String? postalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Postal code is required';
    }
    final regex = RegExp(r'^\d{5}$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid 5-digit postal code';
    }
    return null;
  }

  static String? integer(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid number';
    }
    return null;
  }

  static String? notEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static String? ipAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'IP address is required';
    }
    final regex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
    );
    if (!regex.hasMatch(value)) {
      return 'Enter a valid IPv4 address';
    }
    return null;
  }
}
