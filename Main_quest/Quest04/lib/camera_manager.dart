import 'package:camera/camera.dart';

class CameraManager {
  CameraController? controller;
  List<CameraDescription>? cameras;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize();
    }
  }
}
