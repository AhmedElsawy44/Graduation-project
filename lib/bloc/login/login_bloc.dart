import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isSubmitted: true, isLoading: true, errorMessage: null));
    if (state.isFormFilled == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Please fill in all fields.'));
      return;
    }

    if (state.isEmailValid == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Invalid email format.'));
      return;
    }
    if (state.isPasswordValid == false) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Password must be at least 6 characters.'));
      return;
    }
    
    if (!state.isValid) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Please fill in all fields correctly.'));
      return;
    }

    

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.message ?? 'Login failed',
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'An error occurred: $e',
      ));
    }
  }
}
