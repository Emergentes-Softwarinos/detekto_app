import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadButton extends StatelessWidget {
  final Function(File) onImageSelected;

  const UploadButton({super.key, required this.onImageSelected});

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    if (picked != null) onImageSelected(File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => _pickImage(ImageSource.camera),
          icon: const Icon(Icons.camera_alt),
          label: const Text("Tomar Foto"),
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 16, 184, 72),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () => _pickImage(ImageSource.gallery),
          icon: const Icon(Icons.photo_library),
          label: const Text("Galería"),
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 16, 184, 72),
          ),
        ),
      ],
    );
  }
}
