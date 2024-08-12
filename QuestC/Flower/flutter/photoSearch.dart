import 'package:flutter/material.dart';
import 'photo.dart'; // Photo 모델 클래스
import 'photo_detail.dart';

class PhotoSearch extends SearchDelegate<Photo?> {
  final List<Photo> photos;

  PhotoSearch(this.photos);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // null 반환 가능
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = photos.where((photo) => photo.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].title),
          leading: Image.network(results[index].url, width: 50, height: 50),
          onTap: () {
            // 사용자가 아이템을 탭하면 PhotoDetailPage로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoDetailPage(photo: results[index]),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = photos.where((photo) => photo.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].title),
          leading: Image.network(suggestions[index].url, width: 50, height: 50),
          onTap: () {
            // 이미지를 선택하면 PhotoDetailPage로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoDetailPage(photo: suggestions[index]),
              ),
            );
          },
        );
      },
    );
  }
}
