class Post {
  final String id;
  final DateTime date;
  final String content;
  final String mood;
  final String? answer; // answer 필드 추가

  Post({
    required this.id,
    required this.date,
    required this.content,
    required this.mood,
    this.answer,
  });
}