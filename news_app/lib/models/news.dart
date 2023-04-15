class News {
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;

  News({
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    );
  }
}
