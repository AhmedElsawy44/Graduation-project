import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<EmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));
    on<PasswordChanged>((event, emit) => emit(state.copyWith(password: event.password)));
    on<ConfirmPasswordChanged>((event, emit) => emit(state.copyWith(confirmPassword: event.confirmPassword)));
    on<FirstNameChanged>((event, emit) => emit(state.copyWith(firstName: event.firstName)));
    on<LastNameChanged>((event, emit) => emit(state.copyWith(lastName: event.lastName)));
    on<PhoneChanged>((event, emit) => emit(state.copyWith(phone: event.phone)));
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

 Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
  emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
  try {
    if(state.isFormFilled == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Please fill in all fields'));
      return;
    }
   
    if(state.isEmailValid == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Invalid email format'));
      return;
    }
    if(state.isPasswordValid == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Password must be at least 6 characters'));
      return;
    }
    if(state.isConfirmPasswordValid == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Passwords do not match'));
      return;
    }
    if(state.isPhoneValid == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Phone number must be at least 10 characters'));
      return;
    }
    
    if (!state.isValid) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Please fill in all fields correctly'));
      return;
    }


    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );

    emit(state.copyWith(isLoading: false, isSuccess: true));
  } catch (e) {
    emit(state.copyWith(
      isLoading: false,
      isSuccess: false, 
      errorMessage: e.toString(),
    ));
  }
}
}
