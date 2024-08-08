import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/post_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        title: '오늘 하루 기록',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, // 배경색을 흰색으로 설정
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple[400], // AppBar 배경색 설정 (선택 사항)
            foregroundColor: Colors.white, // AppBar 텍스트 색상 (선택 사항)
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
