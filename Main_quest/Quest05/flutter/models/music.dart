import 'dart:convert'; // For jsonDecode
import 'dart:async'; // For Future
import 'dart:math'; // For Random
import 'package:http/http.dart' as http; // For http.get

// Music 클래스 정의
class Music {
  final String title;
  final String artist;
  final String albumImage;

  Music({
    required this.title,
    required this.artist,
    required this.albumImage,
  });

  // JSON 데이터를 Music 객체로 변환
  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      title: json['title'],
      artist: json['artist'],
      albumImage: json['album_image'],
    );
  }
}

// 추천 음악을 가져오는 함수
Future<List<Music>> fetchRecommendedMusic(String mood) async {
  final url = 'https://bold-renewed-macaw.ngrok-free.app/music/?sentiment=$mood';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final decodedResponse = utf8.decode(response.bodyBytes);
    final data = json.decode(decodedResponse);
    final List<dynamic> items = data['items'];

    // JSON 데이터를 List<Music>으로 변환
    return items.map((json) => Music.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load music data');
  }
}

// 감정 문자열에 따라 추천 음악을 가져오는 함수
Future<List<Music>> getRecommendMusic(String? mood) async {
  try {
    // 이모지를 문자열로 변환하여 API 요청
    final moodString = moodToString(mood);
    if (moodString == null) {
      print('Invalid mood emoji');
      return [];
    }
    final musicList = await fetchRecommendedMusic(moodString);
    final random = Random();
    musicList.shuffle(random);
    return musicList.take(3).toList();
  } catch (e) {
    print('Error: $e'); // Optional: log the error
    return []; // 오류 발생 시 빈 리스트 반환
  }
}

// 이모지를 감정 문자열로 변환하는 함수
String? moodToString(String? mood) {
  switch (mood) {
    case '😊':
      return '행복';
    case '😢':
      return '슬픔';
    case '😠':
      return '분노';
    case '😲':
      return '놀람';
    case '🥺':
      return '불안';
    default:
      return null; // 알 수 없는 이모지인 경우 null 반환
  }
}