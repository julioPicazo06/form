part of 'register_cubit.dart';

// se crea enum para definir el estado del formulario
 enum FormStatus { invalid , valid , validating , posting}
 
 class RegisterState extends Equatable {
  // Se define el estado del formulario
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

// Se inicializa el estado del formulario
 const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.username = '',
    this.email = '',
    this.password = '',
  });

// Se copia el estado del formulario
  RegisterState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) =>
      RegisterState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  
// Se comparan los estados del formulario
  @override
  List<Object> get props => [ formStatus , username , email , password ];
}
// Se define el estado inicial del formulario

