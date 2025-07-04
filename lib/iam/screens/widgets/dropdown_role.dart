import 'package:flutter/material.dart';

class RoleDropdownField extends StatelessWidget {
  final String selectedRole;
  final ValueChanged<String?> onChanged;

  const RoleDropdownField({
    super.key,
    required this.selectedRole,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedRole,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Rol',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      items: const [
        DropdownMenuItem(
          value: 'ROLE_USER',
          child: Text('Usuario'),
        ),
        DropdownMenuItem(
          value: 'ROLE_ADMIN',
          child: Text('Administrador'),
        ),
      ],
    );
  }
}
