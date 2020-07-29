import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/enums/view_states.dart';
import 'package:flutter_responsive_ui/models/album.dart';
import 'package:flutter_responsive_ui/viewmodels/albums_view_model.dart';
import 'package:flutter_responsive_ui/views/base/base_view.dart';
import 'package:flutter_responsive_ui/views/widgets/error_view.dart';
import 'package:flutter_responsive_ui/views/widgets/gridcell.dart';

import 'details.dart';

class LandscapePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<AlbumViewModel>(
        onModelReady: (model) =>
            model.getAlbums(isPortrait: false, isShowLoader: true),
        builder: (context, child, model) => Container(
              color: Colors.transparent,
              child: RefreshIndicator(
                onRefresh: () =>
                    model.getAlbums(isPortrait: false, isShowLoader: false),
                child: Container(
                  color: Colors.transparent,
                  child: _getBodyUi(context: context, model: model),
                ),
              ),
            ));
  }

  _getBodyUi({AlbumViewModel model, BuildContext context}) {
    print(model.state);
    switch (model.state) {
      case ViewState.Busy:
        return circularProgress();
        break;
      case ViewState.Idle:
        return _buildContent(context: context, model: model);
        break;
      case ViewState.Error:
        return _handleErrorData(model: model, context: context);
        break;
      default:
    }
  }

  _handleErrorData({AlbumViewModel model, BuildContext context}) {
    return ErrorView(
      action: () async {
        await model.getAlbums(isPortrait: false, isShowLoader: true);
      },
      message: model.error,
    );
  }

  _buildContent({BuildContext context, AlbumViewModel model}) {
    if (model?.landscapePhotosResponse != null) {
      return Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 0.99),
          padding: EdgeInsets.only(top: 20),
          itemCount: model?.landscapePhotosResponse?.albums?.length,
          itemBuilder: (context, i) {
            final album = model?.landscapePhotosResponse?.albums[i];
            return GestureDetector(
              child: GridTile(
                child: AlbumCell(album),
              ),
//              onTap: () {
//                goToDetailsPage(context, album);
//              },
            );
          },
        ),
      );
    } else {
      return ListView(
        children: <Widget>[],
      );
    }
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  goToDetailsPage(BuildContext context, Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GridDetails(
          curAlbum: album,
        ),
      ),
    );
  }
}
