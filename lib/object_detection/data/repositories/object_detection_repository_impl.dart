import 'dart:io';
import 'package:detekto_app/object_detection/domain/entities/detection_result.dart';
import 'package:detekto_app/object_detection/domain/repositories/object_detection_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ObjectDetectionRepositoryImpl implements ObjectDetectionRepository {
  @override
  Future<DetectionResult> detectObject(File imageFile) async {
    final uri = Uri.parse('http://10.0.2.2:8000/detectar/'); // Para emulador

    final request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath(
        'imagen',
        imageFile.path,
        contentType: MediaType('image', 'png'),
      ),
    );

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final bytes = await response.stream.toBytes();
        final tempDir = Directory.systemTemp;
        final file = File('${tempDir.path}/detected_image.png');
        await file.writeAsBytes(bytes);

        // Aquí puedes definir la clase detectada. Supongamos martillo = 0.0.
        return DetectionResult(imageFile: file, detectedClass: 0.0);
      } else {
        throw Exception('Error en el servidor: ${response.statusCode}');
      }
    } catch (e) {
      print("Error al detectar el objeto: $e");
      rethrow;
    }
  }
}
