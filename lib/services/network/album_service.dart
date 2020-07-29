import 'package:flutter_responsive_ui/models/album.dart';
import 'package:flutter_responsive_ui/utils/app_constants.dart';

import 'network_util.dart';

class AlbumService {
  APIRequest apiRequest = new APIRequest();

  static final portraitUrl = AppConstants.SERVER + "photos?albumId=1";
  static final landscapeUrl = AppConstants.SERVER + "photos?albumId=2";

  static final AlbumService _internal = AlbumService.internal();

  factory AlbumService() => _internal;

  AlbumService.internal();

  Future<AlbumResponse> getAlbumList(bool isPortrait) async {
    return apiRequest
        .get(isPortrait ? portraitUrl : landscapeUrl)
        .then((dynamic response) {
      if (response != null) {
        return AlbumResponse.fromJson(response);
      } else {
        if (response["errorMessage"] != null) {
          return Future.error(response["errorMessage"]);
        } else {
          return Future.error("Error fetching data");
        }
      }
    });
  }
}
