import 'package:flutter/material.dart';
import 'package:portfolio/common_data.dart';

class ScreenAddPortfolio extends StatefulWidget {
  @override
  _ScreenAddPortfolioState createState() => _ScreenAddPortfolioState();
}

class _ScreenAddPortfolioState extends State<ScreenAddPortfolio> {
  MaterialAccentColor _curSelectedColor = Colors.accents[0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ' + LOGO_TITLE),
      ),
      body: Container(
        color: _curSelectedColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInputField(title: 'Title', hint: 'Title'),
              _buildInputField(title: 'Writer', hint: 'Writer'),
              _buildChangeImage(),
              _buildInputField(title: 'Git Address', hint: 'Git Address'),
              _buildInputField(
                title: 'More Information',
                hint: 'More Information',
                multiLine: true,
              ),
              _buildSelectBackColor(),
              SizedBox(
                width: size.width - 50,
                height: 50,
                child: RaisedButton(
                  color: _curSelectedColor.shade100,
                  child: Text(
                    'Add Portfolio'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      {String title,
      String hint,
      TextEditingController controller,
      bool multiLine = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 5,
          ),
          TextField(
            style: TextStyle(backgroundColor: _curSelectedColor.shade100),
            keyboardType: (multiLine) ? TextInputType.multiline : null,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: _curSelectedColor.shade700, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: hint,
            ),
            controller: controller,
          )
        ],
      ),
    );
  }

  /// 포트폴리오 스크린샷 이미지
  Widget _buildChangeImage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      height: 300,
      color: _curSelectedColor.shade100,
    );
  }

  /// 배경색 설정
  Widget _buildSelectBackColor() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        // BoxShadow(
        //   color: _curSelectedColor.withOpacity(0.2),
        //   offset: Offset(0, 0),
        // )
      ]),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      margin: EdgeInsets.only(bottom: 15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: Colors.accents
              .map((color) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: (_curSelectedColor == color) ? 1.0 : 0,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        InkWell(
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: color,
                          ),
                          onTap: () {
                            setState(() {
                              _curSelectedColor = color;
                            });
                          },
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
