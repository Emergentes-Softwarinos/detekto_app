import 'dart:io';

class DetectionResult {
  final File imageFile; // Imagen como archivo físico
  final double detectedClass; // Clase detectada

  DetectionResult({
    required this.imageFile,
    required this.detectedClass,
  });

  // Este método ya no es necesario si no estás trabajando con JSON directamente,
  // pero si lo necesitas en el futuro, podrías agregar un método personalizado.
}
