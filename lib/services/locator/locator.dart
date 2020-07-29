import 'package:flutter_responsive_ui/services/network/network_provider.dart';
import 'package:flutter_responsive_ui/viewmodels/albums_view_model.dart';
import 'package:get_it/get_it.dart';

import '../network/album_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  // register services
  locator.registerLazySingleton(() => AlbumService());

  // register models
  locator.registerLazySingleton(() => NetworkProvider());
  locator.registerFactory(() => AlbumViewModel());
}
