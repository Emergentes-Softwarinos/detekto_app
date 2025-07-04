import 'package:detekto_app/object_detection/data/repositories/object_detection_repository_impl.dart';
import 'package:detekto_app/object_detection/domain/repositories/object_detection_repository.dart';
import 'package:detekto_app/object_detection/domain/usescases/detect_object.dart';
import 'package:detekto_app/object_detection/presentation/bloc/detection_bloc.dart';
import 'package:detekto_app/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ObjectDetectionRepository repository =
        ObjectDetectionRepositoryImpl();
    final DetectObject detectObject = DetectObject(repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DetectionBloc(detectObject),
        ),
      ],
      child: MaterialApp.router(
        title: 'Detekto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF4A148C),
          textTheme: ThemeData.light().textTheme.apply(
                fontFamily: 'Poppins',
              ),
        ),
        routerConfig: routes,
      ),
    );
  }
}
