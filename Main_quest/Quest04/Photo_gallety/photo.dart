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
  Photo(id: 1, url: 'https://cdn.pixabay.com/photo/2019/09/23/04/50/jellyfish-4497496_1280.jpg', title: 'Photo 1'),
  Photo(id: 2, url: 'https://cdn.pixabay.com/photo/2018/05/11/08/11/dog-3389729_1280.jpg', title: 'Photo 2'),
  Photo(id: 3, url: 'https://cdn.pixabay.com/photo/2017/06/09/09/39/adler-2386314_1280.jpg', title: 'Photo 3'),
  Photo(id: 4, url: 'https://cdn.pixabay.com/photo/2016/11/19/13/58/jellyfish-1839389_1280.jpg', title: 'Photo 4'),
  Photo(id: 5, url: 'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg', title: 'Photo 5'),
  Photo(id: 6, url: 'https://cdn.pixabay.com/photo/2014/05/11/13/39/bird-341898_1280.jpg', title: 'Photo 6'),
  Photo(id: 7, url: 'https://cdn.pixabay.com/photo/2021/01/10/18/01/milky-way-5905903_1280.jpg', title: 'Photo 7'),
  Photo(id: 8, url: 'https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_1280.jpg', title: 'Photo 8'),
  Photo(id: 9, url: 'https://cdn.pixabay.com/photo/2024/02/09/23/02/trees-8563877_1280.jpg', title: 'Photo 9'),
  Photo(id: 10, url: 'https://cdn.pixabay.com/photo/2023/09/19/12/34/dog-8262506_1280.jpg', title: 'Photo 10'),
  Photo(id: 11, url: 'https://cdn.pixabay.com/photo/2023/06/29/12/28/cats-8096304_1280.jpg', title: 'Photo 11'),
  Photo(id: 12, url: 'https://cdn.pixabay.com/photo/2021/09/28/13/14/cat-6664412_1280.jpg', title: 'Photo 12'),
  Photo(id: 13, url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Aurelia_aurita_2.jpg/600px-Aurelia_aurita_2.jpg', title: 'Photo 13'),
];
