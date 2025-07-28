

class RegisterState {
  final String email;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
  final String phone;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  // Validators 
  bool get isEmailValid => RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  bool get isPasswordValid => password.length >= 6;
  bool get isPhoneValid => phone.length >= 10;
  bool get isConfirmPasswordValid => confirmPassword == password && confirmPassword.isNotEmpty;
  bool get isFormFilled =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      phone.isNotEmpty;

  bool get isValid =>
      isFormFilled &&
      isEmailValid &&
      isPasswordValid &&
      isPhoneValid &&
      isConfirmPasswordValid;

  const RegisterState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  RegisterState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? firstName,
    String? lastName,
    String? phone,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}

