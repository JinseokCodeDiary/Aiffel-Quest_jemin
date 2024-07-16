import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JellyfishPage(),
    );
  }
}

class JellyfishPage extends StatefulWidget {
  @override
  JellyfishState createState() => JellyfishState();
}

class JellyfishState extends State<JellyfishPage> {
  String result = "";

  // 예측결과와 예측확률 값을 각각 받아오기 위해 fetchData1과 fetchData2 함수 두가지로 나눴으나
  // 중복되는 부분이 있어 하나의 함수로 통합
  // Future<void> fetchData1() async { // 예측결과
  //   try {
  //     final enteredUrl = 'https://5369-218-55-76-70.ngrok-free.app/'; // 입력된 URL 가져오기
  //     final response = await http.get(
  //       Uri.parse(enteredUrl + "sample"), // 입력된 URL 사용
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'ngrok-skip-browser-warning': '69420',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       setState(() {
  //         result =
  //         "predicted_label: ${data['predicted_label']}";
  //       });
  //     } else {
  //       setState(() {
  //         result = "Failed to fetch data. Status Code: ${response.statusCode}";
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       result = "Error: $e";
  //     });
  //   }
  // }
  //
  // Future<void> fetchData2() async { // 예측확률
  //   try {
  //     final enteredUrl = 'https://5369-218-55-76-70.ngrok-free.app/'; // 입력된 URL 가져오기
  //     final response = await http.get(
  //       Uri.parse(enteredUrl + "sample"), // 입력된 URL 사용
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'ngrok-skip-browser-warning': '69420',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       setState(() {
  //         result =
  //         "prediction_score: ${data['prediction_score']}";
  //       });
  //     } else {
  //       setState(() {
  //         result = "Failed to fetch data. Status Code: ${response.statusCode}";
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       result = "Error: $e";
  //     });
  //   }

  Future<void> fetchData(String dataType) async { // 예측결과와 예측확률 모두 처리
    try {
      final enteredUrl = 'https://5369-218-55-76-70.ngrok-free.app/'; // ngrok 입력된 URL 가져오기
      final response = await http.get(
        Uri.parse(enteredUrl + "sample"), // 입력된 URL 사용
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) { // 통신이 원활하다면
        final data = jsonDecode(response.body);
        setState(() {
          if (dataType == "predicted_label") { // 예측결과 값
            result = "predicted_label: ${data['predicted_label']}";
          } else if (dataType == "prediction_score") { // 예측확률 값
            result = "prediction_score: ${data['prediction_score']}";
          }
        });
      } else { // 통신이 원활하지 않는다면
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 204, 50),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FxxXTR%2FbtsICmL1hJf%2FQ9nUBkmaMCDW12y0oZrZ5k%2Fimg.png',
          ),
        ),
        title: Text(
          "Jellyfish Classifier",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromRGBO(204, 255, 255, 150),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300, // 300 * 300
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FAaBYW%2FbtsICmSKZ9E%2FlyM6yh53TzjBA1YM9ErNH1%2Fimg.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20), // 이미지와 버튼 사이의 간격
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 버튼들을 중앙에 배치
                children: <Widget>[
                  ElevatedButton(
                    //onPressed: () => fetchData1, // 함수 변경으로 인한 수정
                    onPressed: () => fetchData("predicted_label"), // fetchData에서 predicted_label의 값만 가져오기
                    child: Text("예측결과 가져오기"),
                  ),
                  SizedBox(width: 40), // 버튼 사이의 간격
                  ElevatedButton(
                    //onPressed: () => fetchData2, // 함수 변경으로 인한 수정
                    onPressed: () => fetchData("prediction_score"), // fetchData에서 prediction_score의 값만 가져오기
                    child: Text("예측확률 가져오기"),
                  ),
                ],
              ),
              SizedBox(height: 20), // 버튼과 결과 텍스트 사이의 간격
              Text(
                result,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*회고
이유진:
아이펠 클라우드가 잘 안돼서 VGG 보델과 api 불러오는 작업은 제민님께서 전담해주셨고, 앱 시각화 작업을 하게 되었습니다.
 도치는 않았지만 기가막힌 업무분담이 되었던것 같습니다. 마지막에 onPressed 버튼을 함수로 지정이 되어있어서 함수가 두개로 나뉘어져 있었는데,
 어짜피 중복되는 함수에 가져오는 데이터만 다른상태라서 함수는 하나로 합치고 dataType을 지정함으로써 불러오는 방법이 있다는 것을 알게되었고,
  get함수에 대해 하나 더 배우게 되었습니다.

유제민:
처음 설명을 들었을 땐 이걸 내가 할 수 있나? 너무 어려운거 같은데...라는 생각이 들었지만 막상 시작하고 나니 지난번 수업에 했던 것들로 완성이 가능했다.
기본 베이스를 만들고 유진님과 fetchData 함수가 2개로 나눠진 것을 하나로 합칠 수 있는 방법을 찾다가 result 값을 dataType에
지정하고 불러올 수 있다는 것을 알고 변경했다. 처음부터 너무 겁을 먹지 말고 자신감 있게 진행하면 더 좋을거 같다.
*/
