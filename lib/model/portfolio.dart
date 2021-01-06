import 'package:flutter/material.dart';

class Portfolio {
  String title;
  String writer;
  String thumbnail;
  String information;
  String github;
  Color backColor;

  Portfolio(
      {this.title,
      this.writer,
      this.thumbnail,
      this.github,
      this.information,
      this.backColor});

  Portfolio.fromMap(Map<String, dynamic> map) : thumbnail = map['thumbnail'];
}
