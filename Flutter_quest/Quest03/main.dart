import 'package:flutter/material.dart';
import 'package:new_app/subquest3/first_page.dart'; 
import 'package:new_app/subquest3/second_page.dart'; 

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Cat and Dog', 
      home: FirstPage(),
      routes: {
        '/second': (context) => SecondPage(), 
      },
    );
  }
}

/* 아쉬운점 
이한나 : stack 제거 구현을 못해서 아쉽고, isCat print 되는 것도 정확하게 되는지 불확실함.. 
 프로젝트를 진행하면서 StatefulWidget과 StatelessWidget의 차이점을 명확히 이해하고, 데이터 전달 및 상태 관리의 중요성을 체감했습니다. 
유제민 : isCat의 true false가 구현이 제대로 안된 것 같고 stack 제거는 시도하지 못 했다. 조금 더 공부가 필요하다.
 */
