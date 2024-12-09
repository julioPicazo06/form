part of 'register_cubit.dart';

// se crea enum para definir el estado del formulario
enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  // Se define el estado del formulario
  final FormStatus formStatus;
  final Username username;
  final String email;
  final Password password;
  final bool isValid;

// Se inicializa el estado del formulario
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
  });

// Se copia el estado del formulario
  RegisterFormState copyWith({
      FormStatus? formStatus,
      Username? username,
      String? email,
      Password? password,
      bool? isValid,
    }) =>
        RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
        );

// Se comparan los estados del formulario
  @override
  List<Object> get props => [formStatus, username, 
   isValid , password];
}
// Se define el estado inicial del formulario

