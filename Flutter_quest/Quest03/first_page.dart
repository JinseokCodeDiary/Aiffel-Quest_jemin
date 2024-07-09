import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{
  bool isCat = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.pink, // 앱바 색상 
        title:  Row(
          children: [
            Image.asset(
              'assets/caticon.png',
              width: 24,
              height: 24), // 고양이 아이콘 추가
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 1,
              height: kToolbarHeight - 16, // 앱바 높이에서 패딩을 뺀 높이
              color: Colors.white,
            ),
            const Text('First Page'), 
          ],
        ) 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCat = false;
                });
                Navigator.pushNamed(
                  context, 
                  '/second',
                  arguments: isCat,
                ); 
                print('is_cat 상태 FirstPage: $isCat');
              },
              child: const Text('Next'),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cat.jpg')),
                  // fit: BoxFit.cover,
              ),
            ), // 디버그 콘솔에 출력
          ],
        ),),
    );
  }
}