import 'dart:io';
import 'package:flutter/material.dart';

class ImagePreviewPage extends StatelessWidget {
  final File imageFile;

  const ImagePreviewPage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado del Escaneo")),
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}
