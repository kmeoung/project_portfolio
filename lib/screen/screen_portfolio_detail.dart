import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/model/portfolio.dart';

class ScreenPortfolioDetail extends StatefulWidget {
  final tag;
  final thumbnail;

  ScreenPortfolioDetail({Key key, @required this.tag, this.thumbnail = ''})
      : super(key: key);

  @override
  _ScreenPortfolioDetailState createState() => _ScreenPortfolioDetailState();
}

class _ScreenPortfolioDetailState extends State<ScreenPortfolioDetail> {
  List<Portfolio> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages.add(Portfolio(title: 'Test', writer: 'Writer'));
    for (int i = 0; i < 3; i++) {
      _pages.add(Portfolio(thumbnail: widget.thumbnail));
    }
    _pages.add(Portfolio(
        github: 'https://github.com/kmeoung', information: 'information ....'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color bgColor = Colors.accents[Random().nextInt(Colors.accents.length)];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Hero(
            tag: widget.tag,
            child: CarouselSlider(
              items: _pages
                  .map(
                    (item) => item.thumbnail != null
                        ? _buildPortfolioChildImg(item)
                        : item.title != null
                            ? _buildPortfolioTitle(item, size, bgColor)
                            : _buildPortfolioLink(item, size),
                  )
                  .toList(),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                height: size.height / 8 * 6.3,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPortfolioTitle(Portfolio item, Size size, Color bgColor) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 5),
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5.0),
            ]),
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: size.height / 10 * 2,
              ),
              Text(
                item.title + item.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                item.writer,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPortfolioLink(Portfolio item, Size size) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Github Link : ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              item.github,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              item.information,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 포트폴리오 이미지
  Widget _buildPortfolioChildImg(Portfolio item) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                    image: NetworkImage(item.thumbnail), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          ),
        ),
      ],
    );
  }
}
