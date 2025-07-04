import 'dart:io';
import '../entities/detection_result.dart';
import '../repositories/object_detection_repository.dart';

class DetectObject {
  final ObjectDetectionRepository repository;

  DetectObject(this.repository);

  Future<DetectionResult> call(File image) async {
    return await repository.detectObject(image);
  }
}
