//void main() {
//  var configuredApp = new AppConfig(
//    appName: 'Flutter',
//    flavorName: 'development',
//    apiBaseUrl: 'https://jsonplaceholder.typicode.com/',
//    child: new MyApp(),
//  );
//
//  runApp(configuredApp);
//}
import 'package:flutter_responsive_ui/services/locator/locator.dart';
import 'package:flutter_responsive_ui/utils/app_constants.dart';

import 'main.dart';

void main() {
  AppConstants.setEnvironment(Environment.DEV);

  setupLocator();
  mainDelegate();
}
