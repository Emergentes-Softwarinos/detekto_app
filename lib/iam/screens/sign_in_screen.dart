import 'package:detekto_app/iam/screens/widgets/auth_submit_button.dart';
import 'package:detekto_app/iam/screens/widgets/auth_text_field.dart';
import 'package:detekto_app/iam/services/sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              AuthTextField(
                controller: _emailController,
                hintText: "Correo o nombre de usuario",
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: _passwordController,
                hintText: "Contraseña",
                obscureText: _obscurePassword,
                onToggleObscure: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
                showToggle: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text("¿No tienes una cuenta? "),
                  TextButton(
                    onPressed: () {
                      context.go("/sign-up");
                    },
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(color: Color(0xFF5DB075)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AuthSubmitButton(
                label: "Continuar",
                onPressed: () async {
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  final success = await SignInService().signIn(email, password);
                  if (success && mounted) {
                    context.go('/home');
                  } else if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Credenciales inválidas')),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navegar a recuperar contraseña
                  },
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      color: Color(0xFF5DB075),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
