// import 'package:flutter/material.dart';
// import 'photo.dart';
// import 'photo_detail.dart';
// import 'camera_screen.dart';  // CameraScreen 클래스를 가져옵니다.
// import 'package:camera/camera.dart';
// import 'photoSearch.dart';
//
//
// void main() => runApp(PhotoGalleryApp());
//
// class PhotoGalleryApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Photo Gallery',
//       home: GalleryPage(),
//     );
//   }
// }
//
// class GalleryPage extends StatefulWidget {
//   @override
//   _GalleryPageState createState() => _GalleryPageState();
// }
//
// class _GalleryPageState extends State<GalleryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gallery'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: dummyPhotos.length,
//         itemBuilder: (context, index) {
//           Photo photo = dummyPhotos[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PhotoDetailPage(photo: photo),
//                 ),
//               );
//             },
//             child: Image.network(photo.url, fit: BoxFit.cover),
//           );
//         },
//       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => CameraScreen(
// //                   onPictureTaken: (photo) {
// //                     setState(() {
// //                       dummyPhotos.add(photo);
// //                     });
// //                     Navigator.pop(context); // 촬영 후 카메라 화면을 닫고 갤러리로 돌아감
// //                   }
// //               ),
// //             ),
// //           );
// //         },
// //         child: Icon(Icons.camera_alt),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
// //     );
// //   }
// // }
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             IconButton(icon: Icon(Icons.camera_alt),onPressed: () {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) => CameraScreen(
//                   onPictureTaken: (photo) {
//                     setState(() {
//                       dummyPhotos.add(photo);
//                     });
//                     Navigator.pop(context); // 촬영 후 카메라 화면을 닫고 갤러리로 돌아감
//                   }
//                 ),
//               ),
//               );
//             },),
//             IconButton(icon: Icon(Icons.menu), onPressed: () {}),
//             IconButton(icon: Icon(Icons.search), onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: PhotoSearch(dummyPhotos),  // PhotoSearch가 dummyPhotos를 받는 것이 맞는지 확인하세요.
//               );
//             },),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }

import 'package:flutter/material.dart';
import 'photo.dart'; // 정의된 Photo 클래스
import 'photo_detail.dart'; // 이미지 상세 페이지
import 'camera_screen.dart'; // 카메라 스크린
import 'package:camera/camera.dart'; // 카메라 패키지
import 'photoSearch.dart'; // 검색 기능
import 'package:http/http.dart' as http; // HTTP 요청을 위한 패키지
import 'dart:convert'; // JSON 변환을 위한 패키지

void main() => runApp(PhotoGalleryApp());

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  Future<Map<String, dynamic>> classifyImage(String imageUrl) async {
    final uri = Uri.parse('http://localhost:5000/predict/');
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'url': imageUrl}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to classify image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PhotoSearch(dummyPhotos),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: dummyPhotos.length,
        itemBuilder: (context, index) {
          Photo photo = dummyPhotos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailPage(photo: photo),
                ),
              );
            },
            child: Image.network(photo.url, fit: BoxFit.cover),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.camera_alt), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraScreen(
                      onPictureTaken: (photo) {
                        setState(() {
                          dummyPhotos.add(photo);
                        });
                        Navigator.pop(context); // 촬영 후 카메라 화면을 닫고 갤러리로 돌아감
                      }
                  ),
                ),
              );
            }),
            IconButton(icon: Icon(Icons.menu), onPressed: (){}),
            IconButton(icon: Icon(Icons.search), onPressed: () {
              showSearch(
                 context: context,
                 delegate: PhotoSearch(dummyPhotos),  // PhotoSearch가 dummyPhotos를 받는 것이 맞는지 확인하세요.
               );}),
          ],
        ),
      ),
    );
  }
}
