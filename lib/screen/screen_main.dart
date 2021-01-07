import 'package:flutter/material.dart';
import 'package:portfolio/common_data.dart';
import 'package:portfolio/screen/screen_add_portfolio.dart';
import 'package:portfolio/widget/main_portfolio_item.dart';

class ScreenMain extends StatefulWidget {
  @override
  _ScreenMainState createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  List<String> _list = <String>[
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.6nCVjA0S936UiBlDUsov4QHaE9%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.whYid2jKN-8c3BUhtIoSTgHaEK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.otIPf0nD6Sxy3HcAhQJnGAHaE8%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.IO2MvrG7m1-23Q3wPtMKSAHaEK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.ECmLpEBDtX8dwVmfHp6-pAHaLH%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.4PQa6uaHcLHierPxk1xZbgHaHa%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.z9DgCgl3z9jhbiJDMuwsOAHaEK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.zGnn7M87JT55AHX8iY8_OAHaEo%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.A79oMqjZkGecXPE1tUmnxQHaEK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.JwlsVQ4dPlGdUu_WP5TfrQHaFj%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.6YQuom0kqQUTMIFyjLB8UQHaDt%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.VOelyj8vVqggmQpXHSK-IQHaNK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.av-cwDFlHUEVpvEyyx40pQHaNK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.S5Wt4shBWKWAb7A5vARZ-AHaEK%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.kwcT0FMG8RvOdjUh_B3OPQHaFj%26pid%3DApi&f=1',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(LOGO_TITLE.toUpperCase()),
      ),
      body: GridView.count(
        childAspectRatio: 0.8, // 너비와 높이 사이의 비율 (child 상자의 비율)
        crossAxisCount: size.width > 300 ? 2 : 1,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 10,
        children: List.generate(100, (index) {
          return _builditems(size, context, index);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenAddPortfolio(),
            ),
          );
        },
      ),
    );
  }

  Center _builditems(Size size, BuildContext context, int index) {
    return Center(
      child: Container(
        width: size.width > 300 ? size.width / 7 * 3 : size.width / 5 * 4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5),
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5.0)
          ],
        ),
        child: MainPortfolioItem(
          list: _list,
          context: context,
          index: index,
        ),
      ),
    );
  }
}
