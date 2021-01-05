import 'package:flutter/material.dart';
import 'package:portfolio/common_data.dart';
import 'package:portfolio/screen/screen_portfolio_detail.dart';

/// 메인화면 포트폴리오 아이템
class MainPortfolioItem extends StatelessWidget {
  const MainPortfolioItem({
    Key key,
    @required List<String> list,
    @required this.context,
    @required this.index,
  })  : _list = list,
        super(key: key);

  final List<String> _list;
  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: LOGO_TITLE + '$index',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(_list[index % _list.length]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          _buildPortfolioInfo()
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenPortfolioDetail(
              tag: LOGO_TITLE + '$index',
              thumbnail: _list[index % _list.length],
            ),
          ),
        );
      },
    );
  }

  /// 포트폴리오 아이템 정보
  Container _buildPortfolioInfo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color: Colors.white),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.ac_unit),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Writer',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Title',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
