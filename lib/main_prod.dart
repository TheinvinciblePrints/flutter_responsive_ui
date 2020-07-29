import 'package:flutter_responsive_ui/main.dart';
import 'package:flutter_responsive_ui/services/locator/locator.dart';
import 'package:flutter_responsive_ui/utils/app_constants.dart';

import 'main.dart';

void main() {
  AppConstants.setEnvironment(Environment.PROD);
  setupLocator();
  mainDelegate();
}
