import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{ 

  @override
  Widget build(BuildContext context){

    final bool? isCat = ModalRoute.of(context)!.settings.arguments as bool;
    print('is_cat 상태 SecondPage 11 : $isCat');
    // Default value if isCat is null
    final displayText = isCat != null && isCat ? 'Cat' : 'false';

    return Scaffold(
      appBar: AppBar(
        title:  const Text('Second Page'),
        leading: Image.asset('assets/dogicon.png'), // 개 아이콘 추가
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SecondPage: $displayText',
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () { 
                print('is_cat 상태 SecondPage : $isCat');
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/dog.jpg')),
                  // fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}