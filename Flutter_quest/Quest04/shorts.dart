import 'package:flutter/material.dart';
import 'home.dart';
import 'subscribe.dart';

class Shorts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery를 사용하여 화면의 너비와 높이를 얻습니다.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 13,
                top: 567,
                child: Container(
                  width: 324,
                  height: 64,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 1,
                        child: InkWell(
                          onTap: (){
                            // home 화면으로 이동이 안되서 push가 아닌 pushNamed로 변경해 봄
                             // Navigator.push(
                             //   context,
                             //   MaterialPageRoute(builder: (context) => Home()),
                             // );
                            // home으로 이동이 안된다...왜지?
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/Subtract (Stroke).png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 71,
                        top: 1,
                        child: Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Short.png")
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 142,
                        top: 1,
                        child: Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Add.png")
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 213,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Subscribe()),
                            // );
                            Navigator.pushNamed(context, '/subscribe');
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/Subscriptions.png")
                                )
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287,
                        top: 6,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 49,
                        child: Text(
                          '홈',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 76,
                        top: 48,
                        child: Text(
                          'Shorts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 226,
                        top: 49,
                        child: Text(
                          '구독',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 302,
                        top: 48,
                        child: Text(
                          '나',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 84,
                child: Container(
                  width: 312,
                  height: 436,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 312,
                          height: 436,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Rectangle 168.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 267,
                        top: 374,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Ellipse 110.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 309,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Ellipse 110.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 374,
                        child: Text(
                          '양식 맛집! #성수동 #감바스 #맛집쇼츠',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 359,
                        child: Text(
                          '> 성수동 맛집 추천합니다.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 321,
                        child: Text(
                          '@aktwlq',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 270,
                        top: 114,
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Like_Fill.png")
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 269,
                        top: 165,
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Dislike_Fill.png")
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 270,
                        top: 216,
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Comment_Fill.png")
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 270,
                        top: 267,
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/Share_Fill.png")
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 269,
                        top: 318,
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Loop.png")
                            )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 275,
                        top: 146,
                        child: Text(
                          '8만',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 269,
                        top: 197,
                        child: Text(
                          '싫어요',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 270,
                        top: 248,
                        child: Text(
                          '3,567',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 274,
                        top: 299,
                        child: Text(
                          '공유',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 269,
                        top: 350,
                        child: Text(
                          '리믹스',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 107,
                        top: 316,
                        child: Container(
                          width: 36,
                          height: 30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 36,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 7,
                                top: 7,
                                child: Text(
                                  '구독',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
