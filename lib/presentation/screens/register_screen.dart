import 'package:flutter/material.dart';
import 'package:form/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
  final validEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z] | {2,})$');
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: "Nombre de usuario",
              onChanged: (value) => username = value,
              validator: (value) {
                if (value == null || value.isEmpty)return "El nombre de usuario es requerido";
                if (value.trim().isEmpty)return "El nombre de usuario no puede contener espacios";
                if (value.length < 6) return "El nombre de usuario debe tener al menos 6 caracteres";
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
                label: "Correo",
                onChanged: (value) => email = value,
                validator: (value) {
                    if ( value  == null || value.isEmpty) return "El correo es requerido";
                    if ( value.trim().isEmpty) return "El correo no puede contener espacios";

                    if (!validEmail.hasMatch(value)) {
                      return "El correo no es válido";
                    }
                }),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: "Contraseña",
              obscureText: true,
              onChanged: (value) => password = value,
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) {
                    print("username: $username");
                    print("email: $email");
                    print("password: $password");
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text("Crear usuario"))
          ],
        ));
  }
}
