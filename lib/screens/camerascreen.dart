import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  @override
  void dispose() {
    // Dispose the camera controller when the widget is disposed
    cameraController?.dispose();
    super.dispose();
  }

  startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController!.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController != null && cameraController!.value.isInitialized) {
      return Scaffold(
        body: Column(
          children: [
            Text(
              'Camera',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 400,
                width: 300,
                child: CameraPreview(cameraController!),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    cameraController!.takePicture().then((XFile? file) {
                      if (mounted) {
                        if (file != null) {
                          print('Picture saved to ${file.path}');
                        }
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.done,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    size: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
