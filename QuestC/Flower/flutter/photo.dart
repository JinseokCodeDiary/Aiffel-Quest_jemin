class Photo {
  int id;
  String url;
  String title;

  Photo({required this.id, required this.url, required this.title});

  // JSON에서 Photo 객체를 생성하는 팩토리 메소드 추가
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
    );
  }
}

List<Photo> dummyPhotos = [
  Photo(id: 1, url: 'https://cdn.pixabay.com/photo/2018/04/09/23/27/nature-3305917_1280.jpg', title: 'Photo 1'),
  Photo(id: 2, url: 'https://cdn.pixabay.com/photo/2019/05/17/20/37/two-red-roses-4210614_960_720.jpg', title: 'Photo 2'),
  Photo(id: 3, url: 'https://cdn.pixabay.com/photo/2020/04/01/06/54/bee-4990174_1280.jpg', title: 'Photo 3'),
  Photo(id: 4, url: 'https://cdn.pixabay.com/photo/2020/02/21/04/15/sunflower-4866445_1280.jpg', title: 'Photo 4'),
  Photo(id: 5, url: 'https://cdn.pixabay.com/photo/2019/07/23/14/18/white-pink-roses-4357824_1280.jpg', title: 'Photo 5'),
  Photo(id: 6, url: 'https://cdn.pixabay.com/photo/2018/04/29/12/48/tulips-3359902_1280.jpg', title: 'Photo 6'),
  Photo(id: 7, url: 'https://cdn.pixabay.com/photo/2020/07/18/12/18/ox-eye-daisy-5417067_1280.jpg', title: 'Photo 7'),
  Photo(id: 8, url: 'https://cdn.pixabay.com/photo/2023/03/10/16/14/tulip-7842665_1280.jpg', title: 'Photo 8'),
  Photo(id: 9, url: 'https://cdn.pixabay.com/photo/2019/02/04/17/43/daisy-3975206_1280.jpg', title: 'Photo 9'),
  Photo(id: 10, url: 'https://cdn.pixabay.com/photo/2021/08/15/06/54/sunflower-6546993_1280.jpg', title: 'Photo 10'),
  Photo(id: 11, url: 'https://cdn.pixabay.com/photo/2023/01/27/05/57/gujeolcho-7747810_1280.jpg', title: 'Photo 11'),
  Photo(id: 12, url: 'https://cdn.pixabay.com/photo/2013/08/31/18/13/flower-177889_1280.jpg', title: 'Photo 12'),
  Photo(id: 13, url: 'https://cdn.pixabay.com/photo/2016/04/30/16/36/dandelion-1363238_1280.jpg', title: 'Photo 13'),
  Photo(id: 10, url: 'https://cdn.pixabay.com/photo/2017/10/04/18/40/pink-flower-2817161_1280.jpg', title: 'Photo 14'),
  Photo(id: 10, url: 'https://cdn.pixabay.com/photo/2019/12/21/09/46/christmas-decoration-4710137_1280.jpg', title: 'Photo 15'),
  Photo(id: 10, url: 'https://cdn.pixabay.com/photo/2016/06/02/20/24/dandelion-1432019_1280.jpg', title: 'Photo 16'),
  Photo(id: 10, url: 'https://cdn.pixabay.com/photo/2016/08/28/23/24/sunflower-1627193_1280.jpg', title: 'Photo 17'),
];
