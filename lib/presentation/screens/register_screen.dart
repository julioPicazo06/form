import 'package:flutter/material.dart';
import 'package:form/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Nuevo Usuario")),
        body: const _RegisterView());
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterLogo(size: 200),
                  SizedBox(height: 20),
                  _RegisterForm(),
                ],
              ),
            )));
  }
}


class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:  Column(
      children: [
       CustomTextFormField(
        label: "Nombre de usuario",
        onChanged: (value) => username = value,
       ) ,
      const SizedBox(height: 20),
      const  CustomTextFormField(
        label: "Correo",
        ) ,
      const SizedBox(height: 20),
      const  CustomTextFormField(
        label: "Contraseña",
        obscureText: true,
        ),
       const SizedBox(height: 20),
       FilledButton.tonalIcon(
          onPressed: (){},
          icon: const Icon(Icons.save),
          label:const Text("Crear usuario")
          
          )
      ],
    ));
  }
}