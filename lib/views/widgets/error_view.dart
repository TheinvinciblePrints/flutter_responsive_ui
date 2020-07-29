import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/utils/custom_styles.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback action;
  final String message;

  ErrorView({@required this.action, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
//          'Connect to the internet & refresh',
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: AppCustomStyles.messageFontSize,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.refresh,
              size: 30.0,
            ),
            onPressed: action,
          ),
        ),
      ],
    );
  }
}
