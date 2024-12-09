import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/blocs/regiter_cubit/register_cubit.dart';
import 'package:form/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Nuevo Usuario")),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        )
      );
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

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final validEmail = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre de usuario",
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty)
                return "El nombre de usuario es requerido";
              if (value.trim().isEmpty)
                return "El nombre de usuario no puede contener espacios";
              if (value.length < 6)
                return "El nombre de usuario debe tener al menos 6 caracteres";
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: "Correo",
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty)
                return "El correo es requerido";
              if (value.trim().isEmpty)
                return "El correo no puede contener espacios";

              if (!validEmail.hasMatch(value)) {
                return "El correo no es válido";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: "Contraseña",
            obscureText: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formKey.currentState?.validate();
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text("Crear usuario"),
          ),
        ],
      ),
    );
  }
}
