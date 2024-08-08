import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/music.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostProvider with ChangeNotifier {
  List<Post> _posts = []; // 포스트 리스트
  final Map<DateTime, String?> _moods = {}; // 날짜별 감정 저장
  final Map<DateTime, List<Music>> _recommendedMusic = {}; // 날짜별 추천 음악 저장
  final Map<DateTime, String?> _answers = {}; // 날짜별 답변 저장
  DateTime? _currentDate; // 현재 날짜를 추적

  List<Post> get posts => _posts; // 외부에서 포스트 리스트를 가져올 수 있도록 제공

  // 감정 데이터(텍스트에 대한 감정 분석)를 서버에서 가져오는 메서드
  Future<Map<String, dynamic>> fetchEmotionData(String text) async {
    final url = Uri.parse('https://bold-renewed-macaw.ngrok-free.app/sentiment/');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'text': text});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // 응답 본문을 UTF-8로 디코딩한 후 JSON으로 변환
        final decodedBody = utf8.decode(response.bodyBytes);
        final responseJson = jsonDecode(decodedBody) as Map<String, dynamic>;
        return responseJson;
      } else {
        throw Exception('Failed to load data'); // 상태 코드가 200이 아닐 때 예외 발생
      }
    } catch (e) {
      throw Exception('Error occurred: $e'); // 오류 발생 시 예외 처리
    }
  }

  // 주어진 날짜에 해당하는 포스트 리스트를 반환
  List<Post> postsByDate(DateTime date) {
    return _posts.where((post) => isSameDay(post.date, date)).toList();
  }

  // 주어진 날짜에 해당하는 추천 음악 리스트를 반환
  List<Music> recommendedMusicByDate(DateTime date) {
    return _recommendedMusic[date] ?? [];
  }

  // 주어진 날짜에 해당하는 감정을 반환
  String? moodByDate(DateTime date) {
    return _moods[date];
  }

  // 주어진 날짜에 해당하는 답변을 반환
  String? answerByDate(DateTime date) {
    return _answers[date];
  }

  // 새 포스트를 추가하는 메서드
  void addPost(Post post) {
    _posts.add(post); // 포스트 추가
    _moods[post.date] = post.mood; // 날짜에 감정 추가
    _answers[post.date] = post.answer; // 날짜에 답변 추가
    notifyListeners(); // 상태가 변경되었음을 알림
  }

  // 기존 포스트를 업데이트하는 메서드
  void updatePost(String id, Post newPost) {
    final index = _posts.indexWhere((post) => post.id == id);
    if (index >= 0) {
      final oldPost = _posts[index];
      _posts[index] = newPost; // 포스트 업데이트

      // 기분과 날짜에 따라 추천 음악 업데이트
      if (oldPost.date != newPost.date || oldPost.mood != newPost.mood) {
        _moods.remove(oldPost.date); // 기존 날짜의 감정 제거
        _answers.remove(oldPost.date); // 기존 날짜의 답변 제거
        _updateRecommendedMusic(newPost.date, newPost.mood); // 새로운 날짜의 추천 음악 업데이트
      } else {
        _moods[newPost.date] = newPost.mood; // 날짜가 변경되지 않은 경우 감정 업데이트
        _answers[newPost.date] = newPost.answer; // 날짜가 변경되지 않은 경우 답변 업데이트
      }

      notifyListeners(); // 상태가 변경되었음을 알림
    }
  }

  // 포스트를 삭제하는 메서드
  void removePost(String id) {
    final postIndex = _posts.indexWhere((post) => post.id == id);
    if (postIndex >= 0) {
      final post = _posts[postIndex];
      _posts.removeAt(postIndex); // 포스트 삭제

      // 기분과 답변 업데이트
      _moods.remove(post.date);
      _answers.remove(post.date);

      // 포스트가 삭제된 후 해당 날짜에 포스트가 없으면 추천 음악 삭제
      if (_posts.every((p) => !isSameDay(p.date, post.date))) {
        _recommendedMusic.remove(post.date);
      }

      notifyListeners(); // 상태가 변경되었음을 알림
    }
  }

  // 추천 음악을 업데이트하는 비동기 메서드
  Future<void> _updateRecommendedMusic(DateTime date, String? mood) async {
    if (mood != null) {
      try {
        final musicList = await getRecommendMusic(mood); // 추천 음악 데이터 가져오기
        _recommendedMusic[date] = musicList; // 추천 음악 저장
        notifyListeners(); // 상태가 변경되었음을 알림
      } catch (e) {
        print('Error updating recommended music: $e'); // 오류 로그 출력
        // 오류 처리 코드 추가 가능
      }
    } else {
      _recommendedMusic.remove(date); // mood가 null인 경우 추천 음악 제거
      notifyListeners(); // 상태가 변경되었음을 알림
    }
  }

  // 두 날짜가 같은 날인지 확인하는 메서드
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  // 현재 날짜를 설정하는 메서드
  void setCurrentDate(DateTime date) {
    _currentDate = date;
  }
}