import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import '../providers/post_provider.dart';
import '../models/music.dart';

class PostScreen extends StatefulWidget {
  final Post? post; // 기존 포스트 데이터 
  final DateTime selectedDay; // 사용자가 선택한 날짜

  PostScreen({this.post, required this.selectedDay});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _contentController = TextEditingController(); // 내용 입력을 위한 텍스트 컨트롤러
  String? _selectedMood; // 선택된 감정
  bool _isButtonEnabled = false; // 버튼 활성화 상태
  String _responseMessage = ''; // 서버 응답 메시지 저장
  String? _responseAnswer; // 서버 응답의 답변 저장
  List<Music> _recommendedMusic = []; // 추천 음악 리스트
  bool _isContentPosted = false; // 작성 완료 버튼 클릭 여부

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      // 기존 포스트가 있을 경우 초기화
      _contentController.text = widget.post!.content;
      _selectedMood = widget.post!.mood;
      _responseAnswer = widget.post!.answer;
      _isContentPosted = true; // 데이터가 있으면 작성 완료 상태로 설정
      _updateRecommendedMusic(); // 추천 음악 업데이트
    }

    _contentController.addListener(_updateButtonState); // 텍스트 변경에 따라 버튼 상태 업데이트
  }

  @override
  void dispose() {
    _contentController.removeListener(_updateButtonState); // 리스너 제거
    _contentController.dispose(); // 컨트롤러 해제
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _contentController.text.isNotEmpty; // 입력 내용이 비어있지 않으면 버튼 활성화
    });
  }

  Future<void> _updateRecommendedMusic() async {
    if (_selectedMood != null) {
      try {
        final postProvider = Provider.of<PostProvider>(context, listen: false);
        final musicList = await getRecommendMusic(_selectedMood!); // 추천 음악 데이터 가져오기
        setState(() {
          _recommendedMusic = musicList;
        });
      } catch (e) {
        print('Error updating recommended music: $e'); // 오류 로그 출력
      }
    }
  }

  Future<void> _postContent() async {
    final content = _contentController.text;
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('내용을 입력해 주세요.')),
      );
      return;
    }

    final postProvider = Provider.of<PostProvider>(context, listen: false);

    try {
      final responseJson = await postProvider.fetchEmotionData(content); // 서버에 내용 전송 및 응답 받기

      print('Response JSON: $responseJson'); // 응답 데이터 로그 출력

      final predictedLabel = responseJson['predicted_label'] as String? ?? '알 수 없음';
      final moodEmoji = _getMoodFromLabel(predictedLabel);
      final responseAnswer = responseJson['answer'] as String?; // 서버 응답의 답변 가져오기

      setState(() {
        _responseMessage = '예측된 감정: $predictedLabel';
        _selectedMood = moodEmoji ?? _selectedMood;
        _responseAnswer = responseAnswer; // 답변 설정
        _isButtonEnabled = _contentController.text.isNotEmpty;
        _isContentPosted = true; // 작성 완료 상태로 설정
        _updateRecommendedMusic(); // 추천 음악 업데이트
      });
    } catch (e) {
      print('Error: $e'); // 에러 로그 출력
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('데이터를 처리하는 동안 오류가 발생했습니다.')),
      );
    }
  }

  void _savePost() {
    final content = _contentController.text;
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('내용을 입력해 주세요.')),
      );
      return;
    }

    final postProvider = Provider.of<PostProvider>(context, listen: false);

    if (widget.post == null) {
      // 새 포스트 추가
      final newPost = Post(
        id: DateTime.now().toString(), // 고유 ID
        date: widget.selectedDay, // 클릭된 날짜 사용
        content: content,
        mood: _selectedMood ?? '', // 기분이 선택되지 않으면 빈 문자열 사용
        answer: _responseAnswer, // 서버 응답의 답변 저장
      );
      postProvider.addPost(newPost);
    } else {
      // 기존 포스트 업데이트
      final updatedPost = Post(
        id: widget.post!.id,
        date: widget.selectedDay, // 클릭된 날짜 사용
        content: content,
        mood: _selectedMood ?? '', // 기분이 선택되지 않으면 빈 문자열 사용
        answer: _responseAnswer, // 서버 응답의 답변 저장
      );
      postProvider.updatePost(widget.post!.id, updatedPost);
    }

    Navigator.of(context).pop(_selectedMood); // 선택된 mood 값을 반환
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post == null ? '하루 기록하기' : '하루 기록하기'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오늘 하루 무슨 일이 있었나요?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: TextField(
                controller: _contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                  hintText: '내용을 입력하세요...',
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _postContent,
              child: Text('작성완료'),
            ),
            SizedBox(height: 10),
            if (_isContentPosted) ...[
              Text(
                '오늘 하루를 보낸 당신에게 해주고 싶은 말',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: [
                  _buildMoodDisplay('😊', '행복'),
                  _buildMoodDisplay('😢', '슬픔'),
                  _buildMoodDisplay('😠', '분노'),
                  _buildMoodDisplay('😲', '놀람'),
                  _buildMoodDisplay('🥺', '불안'),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Text(
                  _responseAnswer ?? '',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '추천 음악',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200, // 그리드뷰의 높이 설정
                child: GridView.builder(
                  scrollDirection: Axis.horizontal, // 수평 스크롤
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // 한 줄에 1개의 항목
                    childAspectRatio: 1.0, // 항목의 비율
                  ),
                  itemCount: _recommendedMusic.length,
                  itemBuilder: (context, index) {
                    final music = _recommendedMusic[index];
                    return GestureDetector(
                      child: Container(
                        width: 150, // 각 항목의 넓이 설정
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Card(
                                child: Image.network(
                                  music.albumImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    music.title,
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    music.artist,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            SizedBox(height: 8),
            // 저장 버튼은 _isContentPosted가 true일 때만 표시
            if (_isContentPosted)
              ElevatedButton(
                onPressed: _isButtonEnabled ? _savePost : null,
                child: Text('저장'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodDisplay(String moodIcon, String moodLabel) {
    return ChoiceChip(
      label: Text(moodIcon),
      selected: _selectedMood == moodIcon,
      onSelected: (selected) {
        setState(() {
          _selectedMood = selected ? moodIcon : null; // 감정 선택 시 상태 업데이트
          _updateRecommendedMusic(); // mood 값 변경 시 추천 음악 업데이트
        });
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.purple[450],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  String? _getMoodFromLabel(String label) {
    switch (label) {
      case '행복':
        return '😊';  // 행복 이모지
      case '슬픔':
        return '😢';  // 슬픔 이모지
      case '분노':
        return '😠';  // 분노 이모지
      case '놀람':
        return '😲';  // 놀람 이모지
      case '불안':
        return '🥺';  // 불안 이모지
      default:
        return null;
    }
  }
}
