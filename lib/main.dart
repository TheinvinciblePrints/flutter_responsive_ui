import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/utils/app_constants.dart';
import 'package:flutter_responsive_ui/views/pages/main_page.dart';

void mainDelegate() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${AppConstants.APP_TITLE}',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}
