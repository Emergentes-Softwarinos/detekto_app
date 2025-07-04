import 'package:detekto_app/iam/screens/widgets/auth_submit_button.dart';
import 'package:detekto_app/iam/screens/widgets/auth_text_field.dart';
import 'package:detekto_app/iam/screens/widgets/dropdown_role.dart';
import 'package:detekto_app/iam/services/sign_up_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _acceptTerms = false;
  String _selectedRole = 'ROLE_USER';

  final _signUpService = SignUpService();

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
                "Crear cuenta",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              AuthTextField(
                controller: _nameController,
                hintText: "Nombre completo",
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: _emailController,
                hintText: "Correo electrónico",
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
              RoleDropdownField(
                selectedRole: _selectedRole,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedRole = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "Acepto los "),
                          TextSpan(
                            text: "Términos y condiciones",
                            style: TextStyle(
                              color: Color(0xFF5DB075),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              AuthSubmitButton(
                label: "Registrarme",
                onPressed: () async {
                  if (!_acceptTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Debes aceptar los términos")),
                    );
                    return;
                  }

                  final message = await _signUpService.signUp(
                    _nameController.text.trim(),
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                    [_selectedRole],
                  );

                  if (message == null) {
                    // Éxito
                    if (context.mounted) {
                      context.go('/sign-in');
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.go("/sign-in");
                  },
                  child: const Text(
                    "¿Ya tienes una cuenta? Inicia sesión",
                    style: TextStyle(color: Color(0xFF5DB075)),
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
