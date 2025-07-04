import 'package:flutter/material.dart';
import 'package:detekto_app/object_detection/presentation/pages/camera_page.dart';

class ScannerButton extends StatelessWidget {
  const ScannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CameraPage()),
        );
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
              offset: Offset(0, 4),
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
      ),
    );
  }
}
