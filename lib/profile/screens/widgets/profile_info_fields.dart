import 'package:flutter/material.dart';

class ProfileInfoFields extends StatelessWidget {
  const ProfileInfoFields({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ReadOnlyField(
            label: "Nombre completo", value: "Abel Anderson De La Piedra"),
        _ReadOnlyField(label: "Correo", value: "u2050@upc.edu.pe"),
        _ReadOnlyField(label: "Género", value: "Hombre"),
        _ReadOnlyField(label: "Edad", value: "19 Años"),
      ],
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
