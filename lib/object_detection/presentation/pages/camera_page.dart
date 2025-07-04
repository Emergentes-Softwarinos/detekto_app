import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detection_bloc.dart';
import '../bloc/detection_event.dart';
import '../bloc/detection_state.dart';
import '../widgets/camera_view.dart';
import '../widgets/upload_button.dart';
import 'hammer_list_page.dart';
import 'image_preview_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  void _handleImageSelected(BuildContext context, File image) {
    context.read<DetectionBloc>().add(ImageSelectedEvent(image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Detector de Herramientas")),
      body: BlocConsumer<DetectionBloc, DetectionState>(
        listener: (context, state) {
          if (state is DetectionSuccess) {
            if (state.result.detectedClass == 0.0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HammerListPage()));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ImagePreviewPage(imageFile: state.result.imageFile),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const Expanded(child: CameraView()),
              UploadButton(
                  onImageSelected: (file) =>
                      _handleImageSelected(context, file)),
              if (state is DetectionLoading) const CircularProgressIndicator(),
              if (state is DetectionError) Text(state.message),
            ],
          );
        },
      ),
    );
  }
}
