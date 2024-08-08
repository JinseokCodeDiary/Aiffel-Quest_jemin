import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/post_provider.dart';
import '../models/post.dart';
import 'post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDay = DateTime.now(); // 현재 선택된 날짜
  DateTime _focusedDay = DateTime.now(); // 캘린더에서 포커스된 날짜
  String? _selectedMood; // 선택된 기분 (기분 선택 기능이 있을 경우)

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context); // PostProvider 인스턴스를 가져옴
    final posts = postProvider.postsByDate(_selectedDay); // 선택된 날짜에 해당하는 포스트 리스트
    final hasPosts = posts.isNotEmpty; // 선택된 날짜에 포스트가 있는지 여부

    return Scaffold(
      appBar: AppBar(
        title: Text('하루 감정 기록'), // 앱 바의 제목 설정
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay, // 캘린더에서 포커스된 날짜
              firstDay: DateTime.utc(2010, 10, 16), // 캘린더의 시작 날짜
              lastDay: DateTime.utc(2030, 3, 14), // 캘린더의 끝 날짜
              calendarFormat: CalendarFormat.week, // 주 단위 캘린더 포맷 설정
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day); // 선택된 날짜와 같은 날짜를 선택 상태로 설정
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay; // 선택된 날짜 업데이트
                  _focusedDay = focusedDay; // 포커스된 날짜 업데이트
                  _selectedMood = postProvider.moodByDate(_selectedDay); // 선택된 날짜에 대한 기분 가져오기
                  postProvider.setCurrentDate(_selectedDay); // 현재 날짜를 PostProvider에 설정
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay; // 페이지 변경 시 포커스된 날짜 업데이트
                });
              },
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.black), // 평일 텍스트 스타일
                weekendStyle: TextStyle(color: Colors.red), // 주말 텍스트 스타일
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // 포맷 버튼 숨김
                titleTextStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // 헤더 제목 스타일
                leftChevronIcon: Icon(Icons.chevron_left), // 왼쪽 화살표 아이콘
                rightChevronIcon: Icon(Icons.chevron_right), // 오른쪽 화살표 아이콘
                leftChevronPadding: EdgeInsets.only(left: 16.0), // 왼쪽 화살표 아이콘 여백
                rightChevronPadding: EdgeInsets.only(right: 16.0), // 오른쪽 화살표 아이콘 여백
              ),
            ),
            Container(
              padding: EdgeInsets.all(13.0), // 컨테이너 패딩
              alignment: Alignment.centerLeft, // 텍스트 정렬
              child: Text(
                '오늘의 기록',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Consumer<PostProvider>(
              builder: (ctx, postProvider, _) {
                final posts = postProvider.postsByDate(_selectedDay); // 선택된 날짜에 대한 포스트 리스트

                return hasPosts
                    ? ListView.builder(
                  shrinkWrap: true,  // 리스트뷰의 높이를 아이템에 맞게 조정
                  physics: NeverScrollableScrollPhysics(),  // 리스트뷰 자체 스크롤 비활성화
                  itemCount: posts.length, // 아이템 개수
                  itemBuilder: (ctx, index) {
                    final post = posts[index]; // 포스트 데이터
                    return _buildPostItem(post, postProvider); // 포스트 아이템 빌드
                  },
                )
                    : Padding(
                  padding: const EdgeInsets.only(top: 115.0), // 상단 여백 추가
                  child: Center(
                    child: Text(
                      '오늘의 기록이 없습니다',
                      style: TextStyle(fontSize: 18.0, color: Colors.grey), // 메시지 스타일
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // '하루 기록하기' 화면으로 이동
          final selectedMood = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PostScreen(selectedDay: _selectedDay),
            ),
          );

          if (selectedMood != null) {
            setState(() {
              _selectedMood = selectedMood; // 선택된 기분 업데이트
              // 선택된 기분에 따라 추천 음악 업데이트는 제거됨
            });
          }
        },
        child: Icon(Icons.add), // 플로팅 액션 버튼 아이콘
      ),
    );
  }

  Widget _buildPostItem(Post post, PostProvider postProvider) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PostScreen(post: post, selectedDay: _selectedDay), // 포스트 클릭 시 PostScreen으로 이동
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0), // 카드 마진 설정
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1.0), // 카드 테두리 설정
          borderRadius: BorderRadius.circular(8.0), // 카드 모서리 둥글기
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0), // 카드 내 패딩
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // 행의 수직 정렬
            children: <Widget>[
              Text(
                post.mood,
                style: TextStyle(fontSize: 18.0, color: Colors.black), // 기분 텍스트 스타일
              ),
              SizedBox(width: 8.0), // 기분과 내용 사이의 여백
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 열의 수평 정렬
                  children: <Widget>[
                    Text(
                      post.content,
                      style: TextStyle(fontSize: 16.0), // 내용 텍스트 스타일
                      maxLines: 2,  // 최대 2줄까지만 표시
                      overflow: TextOverflow.ellipsis,  // 넘치는 텍스트는 ...으로 표시
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showDeleteConfirmation(post, postProvider); // 삭제 버튼 클릭 시 확인 대화상자 표시
                },
                child: Container(
                  padding: EdgeInsets.all(4.0), // 삭제 아이콘 내 여백
                  child: Icon(Icons.delete, color: Colors.grey, size: 20.0), // 삭제 아이콘
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(Post post, PostProvider postProvider) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // 대화상자 모서리 둥글기
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: EdgeInsets.all(16.0), // 카드 마진 설정
              child: Padding(
                padding: EdgeInsets.all(16.0), // 카드 내 패딩
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '삭제 확인',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), // 대화상자 제목 스타일
                    ),
                    SizedBox(height: 16.0), // 제목과 본문 사이의 여백
                    Text(
                      '이 기록을 삭제하시겠습니까?',
                      style: TextStyle(fontSize: 16.0), // 대화상자 본문 스타일
                      textAlign: TextAlign.center, // 본문 텍스트 정렬
                    ),
                    SizedBox(height: 20.0), // 본문과 버튼 사이의 여백
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(); // 취소 버튼 클릭 시 대화상자 닫기
                          },
                          child: Text('취소'), // 취소 버튼 텍스트
                        ),
                        ElevatedButton(
                          onPressed: () {
                            postProvider.removePost(post.id); // 삭제 버튼 클릭 시 포스트 삭제
                            Navigator.of(ctx).pop(); // 대화상자 닫기
                          },
                          child: Text('삭제'), // 삭제 버튼 텍스트
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
