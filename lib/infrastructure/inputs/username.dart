import 'package:formz/formz.dart';

enum UserNameError { empty  , length }

class UserName extends FormzInput<String , UserNameError>{

  const UserName.pure() : super.pure('');
  const UserName.dirty( String value ) : super.dirty(value);

  @override
  UsserNameError? validator(String value){

    if ( value.isEmpty ) return UserNameError.empty;


    return value.isEmpty ? NameInputError.empty : null
  }


}