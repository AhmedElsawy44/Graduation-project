abstract class RegisterEvent {}

class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  ConfirmPasswordChanged(this.confirmPassword);
}

class FirstNameChanged extends RegisterEvent {
  final String firstName;
  FirstNameChanged(this.firstName);
}

class LastNameChanged extends RegisterEvent {
  final String lastName;
  LastNameChanged(this.lastName);
}

class PhoneChanged extends RegisterEvent {
  final String phone;
  PhoneChanged(this.phone);
}

class RegisterSubmitted extends RegisterEvent {}
