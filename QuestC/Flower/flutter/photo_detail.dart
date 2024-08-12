// import 'package:flutter/material.dart';
// import 'photo.dart';  // Photo 클래스를 가져옵니다.
//
// class PhotoDetailPage extends StatelessWidget {
//   final Photo photo;
//
//   PhotoDetailPage({required this.photo});
//
//   @override
//   Widget build(BuildContext context) {
//     // 디바이스 화면 크기를 얻기 위해 MediaQuery를 사용합니다.
//     final Size screenSize = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(photo.title),
//       ),
//       body: SingleChildScrollView( // 이미지와 텍스트 콘텐츠를 스크롤할 수 있도록 SingleChildScrollView 추가
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               // AspectRatio를 사용하여 이미지가 원본 비율을 유지하면서 적절한 크기로 조정되도록 합니다.
//               child: AspectRatio(
//                 aspectRatio: 1, // 일반적으로 이미지의 가로 세로 비율을 1:1로 설정할 수 있으나, 필요에 따라 조정이 가능합니다.
//                 child: Container(
//                   width: double.infinity, // 컨테이너의 너비를 최대로 확장합니다.
//                   decoration: BoxDecoration(
//                     // 네트워크 이미지를 BoxDecoration의 image 속성을 통해 처리합니다.
//                     image: DecorationImage(
//                       fit: BoxFit.contain, // BoxFit.contain으로 설정하여 이미지 전체가 보이도록 합니다.
//                       image: NetworkImage(photo.url),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 photo.title,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoDetailPage extends StatefulWidget {
  final Photo photo;

  PhotoDetailPage({required this.photo});

  @override
  _PhotoDetailPageState createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage> {
  String classificationResult = "Classifying..."; // 초기 분류 상태 메시지
  String classificationScore = "Classifying...";

  @override
  void initState() {
    super.initState();
    classifyImage();
  }

  Future<void> classifyImage() async {
    try {
      final uri = Uri.parse('http://localhost:5000/predict/');
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'url': widget.photo.url}),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        setState(() {
          classificationResult = "Label: ${result['predicted_label']}"; // 예측 레이블 표시
          classificationScore = "Score: ${result['prediction_score']}"; // 예측 점수 표시
        });
      } else {
        setState(() {
          classificationResult = "Failed to classify image";
        });
      }
    } catch (e) {
      setState(() {
        classificationResult = "Error: ${e.toString()}";
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.photo.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(widget.photo.url),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.photo.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                classificationResult,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                classificationScore,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
