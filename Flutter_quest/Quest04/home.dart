import 'package:flutter/material.dart';
import 'package:my_project/subQuest14/shorts.dart';
import 'subscribe.dart';

class Home extends StatelessWidget {
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
                left: 19,
                top: 32,
                child: Container(
                  width: 321.60,
                  height: 25,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 73,
                          height: 16,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Youtubelogo.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 227,
                        top: 0,
                        child: Container(
                          width: 28,
                          height: 28,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/cast.png"),
                              )
                            ),
                        ),
                      ),
                      Positioned(
                        left: 257,
                        top: 0,
                        child: Container(
                          width: 28,
                          height: 28,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/Notification.png"),
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287,
                        top: 0,
                        child: Container(
                          width: 28,
                          height: 28,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/search.png"),
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 0,
                        child: Container(
                          width: 25,
                          height: 25,
                          padding: const EdgeInsets.symmetric(horizontal: 4.17, vertical: 2.08),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Column(
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
                        child: Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Subtract (Stroke).png"),
                              fit: BoxFit.fill,
                            ),
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
                        left: 71,
                        top: 1,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Shorts()),
                            // );
                            Navigator.pushNamed(context, '/shorts');
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/Short.png"),
                                  fit: BoxFit.fill,
                                ),
                            ),
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 155,
                child: Container(
                  width: 143,
                  height: 193,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Rectangle 168.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 155,
                child: Container(
                  width: 143,
                  height: 193,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Rectangle 169.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 357,
                child: Container(
                  width: 143,
                  height: 193,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Rectangle 170.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 357,
                child: Container(
                  width: 143,
                  height: 193,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Rectangle 171.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 69,
                child: Container(
                  width: 308,
                  height: 31,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 58,
                        top: 0,
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
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 6,
                                top: 7,
                                child: Text(
                                  '전체',
                                  style: TextStyle(
                                    color: Colors.white,
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
                      Positioned(
                        left: 0,
                        top: 1,
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
                                left: 4,
                                top: 1,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/Explore.png")
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 109,
                        top: 0,
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
                                left: 6,
                                top: 7,
                                child: Text(
                                  '게임',
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
                      Positioned(
                        left: 164,
                        top: 0,
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
                                left: 6,
                                top: 7,
                                child: Text(
                                  '뉴스',
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
                      Positioned(
                        left: 221,
                        top: 0,
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
                                left: 6,
                                top: 7,
                                child: Text(
                                  '음악',
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
                      Positioned(
                        left: 272,
                        top: 0,
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
                                  '믹스',
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
              Positioned(
                left: 13,
                top: 109,
                child: Container(
                  width: 114,
                  height: 37,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/shorts.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 4,
                        child: Text(
                          'Shorts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
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
      ],
    ),
    );
  }
}