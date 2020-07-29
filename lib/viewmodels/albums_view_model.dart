import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_responsive_ui/enums/view_states.dart';
import 'package:flutter_responsive_ui/models/album.dart';
import 'package:flutter_responsive_ui/services/locator/locator.dart';
import 'package:flutter_responsive_ui/services/network/album_service.dart';

import 'base_model.dart';

class AlbumViewModel extends BaseModel {
  AlbumService api = locator<AlbumService>();
  AlbumResponse _portraitPhotosResponse;

  AlbumResponse get portraitPhotosResponse => _portraitPhotosResponse;

  AlbumResponse _landscapePhotosResponse;

  AlbumResponse get landscapePhotosResponse => _landscapePhotosResponse;

  dynamic _error;

  dynamic get error => _error;

  final _isSelected = <bool>[true, false];

  get isSelected => _isSelected;

  int _selectedindex = 0;

  get selectedindex => _selectedindex;

  void switchPage(int page) async {
    switch (page) {
      case 0:
        _isSelected[page] = true;
        _isSelected[1] = false;
        _selectedindex = page;
        break;
      default:
        _isSelected[0] = false;
        _isSelected[page] = true;
        _selectedindex = page;
    }
    refreshState();
  }

  refreshState() {
    setState(ViewState.Idle);
  }

  Future getAlbums({isShowLoader, isPortrait}) async {
    if (isPortrait) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    if (isShowLoader) {
      setState(ViewState.Busy);
    }

    try {
      if (isPortrait) {
        _portraitPhotosResponse = await api.getAlbumList(isPortrait);
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
        _landscapePhotosResponse = await api.getAlbumList(isPortrait);
      }
      setState(ViewState.Idle);
    } catch (error) {
      if (error is SocketException) {
        _error = 'Request timeout please refresh';
        setState(ViewState.Error);
      } else {
        _error = error.toString();
        setState(ViewState.Error);
      }
    }
  }
}
