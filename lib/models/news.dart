class News {
  String id;
  String title;

  String imagePath;
  String body;
  String time;

  News({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.body,
    required this.time,
  });

  static List<News> getNews() {
    return [
      News(
          id: '1',
          title: 'News1',
          imagePath: 'assets/images/img_news.png',
          body: 'News 1 descript',
          time: '1h ago'),
      News(
          id: '2',
          title: 'News2',
          imagePath: 'assets/images/img_news.png',
          body: 'News 2 descript',
          time: '2h ago'),
      News(
          id: '3',
          title: 'News3',
          imagePath: 'assets/images/img_news.png',
          body: 'News 3 descript',
          time: '3h ago'),
    ];
  }
}
