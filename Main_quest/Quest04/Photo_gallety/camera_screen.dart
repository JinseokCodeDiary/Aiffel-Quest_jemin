import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'photo.dart';  // Photo 클래스 import

class CameraScreen extends StatefulWidget {
  final Function(Photo) onPictureTaken; // 콜백 함수

  CameraScreen({required this.onPictureTaken});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _controller = CameraController(_cameras![0], ResolutionPreset.high);
      _controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  Future<void> _takePicture() async {
    if (_controller!.value.isInitialized) {
      final XFile? file = await _controller!.takePicture();
      if (file != null) {
        Photo newPhoto = Photo(id: dummyPhotos.length + 1, url: file.path, title: 'New Photo');
        widget.onPictureTaken(newPhoto);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카메라'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _controller == null || !_controller!.value.isInitialized
                ? Center(child: CircularProgressIndicator())
                : CameraPreview(_controller!),  // 카메라 미리보기
          ),
          ElevatedButton(
            onPressed: _takePicture,
            child: Icon(Icons.camera),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
