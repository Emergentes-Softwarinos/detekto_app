import '../entities/detection_result.dart';
import 'dart:io';

abstract class ObjectDetectionRepository {
  Future<DetectionResult> detectObject(File imageFile);
}
