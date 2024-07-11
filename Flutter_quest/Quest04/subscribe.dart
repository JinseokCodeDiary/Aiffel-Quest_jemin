import 'package:flutter/material.dart';
import 'home.dart';
import 'shorts.dart';

class Subscribe extends StatelessWidget {
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
                left: 24,
                top: 135,
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
                left: 75,
                top: 135,
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
                          '오늘',
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
                left: 24,
                top: 373,
                child: Container(
                  width: 313,
                  height: 177,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 1,
                        top: 24,
                        child: Container(
                          width: 143,
                          height: 153,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Rectangle 170.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 170,
                        top: 24,
                        child: Container(
                          width: 143,
                          height: 153,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Rectangle 171.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 76,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/shorts.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                top: 2,
                                child: Text(
                                  'Shorts',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
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
              ),
              Positioned(
                left: 13,
                top: 568,
                child: Container(
                  width: 324,
                  height: 63,
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
                            Navigator.pushNamed(context, '/home'); // 홈 페이지로 이동
                          },
                          child: Container( // 컨테이너 크기를 지정하고, 그 크기 내에 이미지를 맞춰서 출력
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
                        child: InkWell(
                          onTap: () {
                            // home 화면으로 이동이 안되서 push가 아닌 pushNamed로 변경해 봄
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Shorts()),
                            // );
                            Navigator.pushNamed(context, '/shorts'); // 쇼츠 페이지로 이동
                          },
                          child: Container( // 컨테이너 크기를 지정하고, 그 크기 내에 이미지를 맞춰서 출력
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
                      Positioned(
                        left: 287,
                        top: 5,
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
                        top: 48,
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
                        top: 47,
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
                        top: 48,
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
                        top: 47,
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
                        top: 2,
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
                      Positioned(
                        left: 215,
                        top: 0,
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
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
                left: 23,
                top: 63,
                child: Container(
                  width: 47,
                  height: 47,
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
                left: 97,
                top: 63,
                child: Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Ellipse 112.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: 171,
                top: 63,
                child: Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Ellipse 113.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: 319,
                top: 63,
                child: Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Ellipse 114.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: 245,
                top: 63,
                child: Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Ellipse 115.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 110,
                child: Text(
                  '최지우',
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
                left: 178,
                top: 113,
                child: Text(
                  '차투리',
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
                left: 90,
                top: 113,
                child: Text(
                  'supergogo',
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
                left: 253,
                top: 113,
                child: Text(
                  '감블러',
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
                left: 332,
                top: 113,
                child: Text(
                  '포셔',
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
                left: 124,
                top: 135,
                child: Container(
                  width: 47,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 47,
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
                        child: SizedBox(
                          width: 35,
                          child: Text(
                            '동영상',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 184,
                top: 135,
                child: Container(
                  width: 51,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 51,
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 248,
                top: 135,
                child: Container(
                  width: 48,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 48,
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
                          '라이브',
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
                left: 305,
                top: 135,
                child: Container(
                  width: 48,
                  height: 30,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 48,
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
                          '게시물',
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
                left: 0,
                top: 177,
                child: Container(
                  width: 360,
                  height: 188,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 12,
                        top: 151,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Ellipse 112.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 59,
                        top: 169,
                        child: Text(
                          'supergogo',
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
                        left: 124,
                        top: 172,
                        child: Text(
                          '조회수 4.7천회',
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
                        left: 204,
                        top: 173,
                        child: Text(
                          '1시간 전',
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
                        left: 330,
                        top: 162,
                        child: Container(
                          width: 21,
                          height: 21,
                          padding: const EdgeInsets.symmetric(vertical: 3.94),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 2.62,
                                height: 2.62,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF0B0B0B),
                                  shape: OvalBorder(),
                                ),
                              ),
                              Container(
                                width: 2.62,
                                height: 2.62,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF0B0B0B),
                                  shape: OvalBorder(),
                                ),
                              ),
                              Container(
                                width: 2.62,
                                height: 2.62,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF0B0B0B),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 360,
                          height: 149,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/Rectangle 177.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 58,
                        top: 154,
                        child: Text(
                          '사람들에게 좋은 인상을 줄 수 있는 웃음짓기',
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
      ],
      ),
    );
  }
}
