class Portfolio {
  String tag;
  String thumbnail;

  Portfolio(this.tag, this.thumbnail);

  Portfolio.fromMap(Map<String, dynamic> map)
      : tag = map['tag'],
        thumbnail = map['thumbnail'];
}
