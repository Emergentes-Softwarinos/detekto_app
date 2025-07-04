import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class DetectionEvent extends Equatable {
  const DetectionEvent();

  @override
  List<Object?> get props => [];
}

class ImageSelectedEvent extends DetectionEvent {
  final File image;

  const ImageSelectedEvent(this.image);

  @override
  List<Object?> get props => [image];
}
