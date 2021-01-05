import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common_data.dart';
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
    for (int i = 0; i < 3; i++) {
      _pages.add(Portfolio(widget.tag, widget.thumbnail));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(LOGO_TITLE.toUpperCase()),
      ),
      body: Center(
        child: CarouselSlider(
          items: _pages.map((item) => _buildPortfolioChild(item)).toList(),
          options: CarouselOptions(
              scrollDirection: Axis.horizontal, height: size.height / 8 * 6),
        ),
      ),
    );
  }

  Widget _buildPortfolioChild(Portfolio item) {
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
            margin: EdgeInsets.symmetric(horizontal: 5.0),
          ),
        ),
        Text('Writer'),
        SizedBox(
          height: 3.0,
        ),
        Text(
            'lalablahlalablahlalablahlalablahlalablahlalablahlalablahlalablahlalablahlalablahlalablahlalablah')
      ],
    );
  }
}
