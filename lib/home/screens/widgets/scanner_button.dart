import 'package:flutter/material.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // TODO: acción de escaneo
        },
        child: Container(
          width: 245,
          height: 245,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF5DB075),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 4), // Cambia la posición de la sombra
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.qr_code_scanner,
              size: 100,
              color: Color(0xFF5DB075),
            ),
          ),
        ));
  }
}
