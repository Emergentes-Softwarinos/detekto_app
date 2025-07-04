import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder, podrías integrar cámara en vivo con `camera` package si lo deseas
    return Container(
      color: Colors.black12,
      child: const Center(child: Text("Vista previa de la cámara")),
    );
  }
}
