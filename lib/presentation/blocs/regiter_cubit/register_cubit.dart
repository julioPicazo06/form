import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void onSubmit() {
    print('submmit : $state');
  }

  // Se definen los metodos para cambiar el estado del formulario
  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }
}
