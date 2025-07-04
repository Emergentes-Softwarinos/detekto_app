import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usescases/detect_object.dart';
import '../../domain/entities/detection_result.dart';
import 'detection_event.dart';
import 'detection_state.dart';

class DetectionBloc extends Bloc<DetectionEvent, DetectionState> {
  final DetectObject detectObject;

  DetectionBloc(this.detectObject) : super(DetectionInitial()) {
    on<ImageSelectedEvent>((event, emit) async {
      emit(DetectionLoading());

      try {
        final DetectionResult result = await detectObject(event.image);
        emit(DetectionSuccess(result));
      } catch (e) {
        emit(DetectionError("Error al detectar el objeto: $e"));
      }
    });
  }
}
