import 'package:detekto_app/profile/models/store_vendor.dart';
import 'package:flutter/material.dart';

class ProfileInfoFields extends StatelessWidget {
  final StoreVendor vendor;

  const ProfileInfoFields({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ReadOnlyField(label: "Nombre completo", value: vendor.username),
        _ReadOnlyField(label: "Correo", value: vendor.email),
        _ReadOnlyField(label: "Género", value: vendor.gender),
        _ReadOnlyField(label: "Edad", value: vendor.age),
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
