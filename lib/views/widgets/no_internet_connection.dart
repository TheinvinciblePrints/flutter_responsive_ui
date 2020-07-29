import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/utils/custom_styles.dart';

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return _portraitView();
    } else {
      return _landscapeView();
    }
  }

  Widget _titleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: _textItem('No Internet Connection', 'title'),
    );
  }

  Widget _subTitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: <Widget>[
          _textItem('You are not connected to the internet.', 'subtitle'),
          _textItem(
              'Make sure Wi-Fi is on, Airplane Mode is off\n and try again',
              'subtitle'),
        ],
      ),
    );
  }

  Widget _textItem(String text, String type) {
    final TextStyle _titleTextStyle = TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

    final TextStyle _subTitleTextStyle = TextStyle(
        color: Colors.grey,
        fontSize: AppCustomStyles.subTitleFontSize,
        fontWeight: FontWeight.bold);

    switch (type) {
      case 'title':
        return Text(
          text,
          style: _titleTextStyle,
          textAlign: TextAlign.center,
        );
        break;

      case 'subtitle':
        return Text(
          text,
          style: _subTitleTextStyle,
          textAlign: TextAlign.center,
        );
        break;
    }
  }

  Widget _portraitView() {
    return Container(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/no_internet.png'),
          ),
          _titleText(),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: _subTitleText(),
          ),
        ],
      ),
    );
  }

  Widget _landscapeView() {
    return new Padding(
      padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: new Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/no_internet.png'),
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: _titleText(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: _subTitleText(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
