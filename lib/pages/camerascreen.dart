import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'displaypicturescreen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  CameraDescription? firstCamera;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    firstCamera = cameras!.first;
    controller = CameraController(
      firstCamera!,
      ResolutionPreset.high,
    );
    await controller!.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> takeAndDisplayPicture() async {
    if (!controller!.value.isInitialized) {
      print('Error: select a camera first.');
      return;
    }

    final image = await controller!.takePicture();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(
          imagePath: image.path,
          onGoBack: initializeCamera,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: CameraPreview(controller!),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3, // 테두리 두께
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: takeAndDisplayPicture,
          child: Text('Take Picture'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xffFF6B40),
          ),
        ),
      ),
    );
  }
}
