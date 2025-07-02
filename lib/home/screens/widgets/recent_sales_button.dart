import 'package:flutter/material.dart';

class RecentSalesButton extends StatelessWidget {
  const RecentSalesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Implementar la navegación a la pantalla de ventas recientes
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5DB075), // Color verde
        minimumSize: const Size.fromHeight(65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Ventas recientes',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
