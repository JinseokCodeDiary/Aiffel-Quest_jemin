import 'package:flutter/material.dart';
import 'home.dart';
import 'shorts.dart';
import 'subscribe.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Youtube',
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/shorts': (context) => Shorts(),
        '/subscribe': (context) => Subscribe()
      },
    );
  }
}

// 회고
// 피그마로 만든 화면을 플러터로 구현하는데 생각 이상으로 어려움이 많았다...
// 피그마에서 만들 때는 마우스로 만들 수 있어서 원하는 위치에 잘 갔지만
// 플러터로는 그게 불가능해서 많이 헤멘거 같다...
// 지금 만든 앱도 반응형이 아닌 고정 좌표 값으로 들어가 핸드폰 사이즈가 바뀌면
// 위치가 잘 안맞게 되는데 추후에 이를 해결할 수 있어야겠다.