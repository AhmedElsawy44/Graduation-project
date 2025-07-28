class LoginState {
  final String email;
  final String password;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool isSubmitted;

  bool get isEmailValid => RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  bool get isPasswordValid => password.length >= 6;
  bool get isValid => isEmailValid && isPasswordValid;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isSubmitted = false,
  });

  get isFormFilled => email.isNotEmpty && password.isNotEmpty;

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isSubmitted,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}
