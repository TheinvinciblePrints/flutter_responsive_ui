import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/models/album.dart';
import 'package:flutter_responsive_ui/utils/custom_styles.dart';

class AlbumCell extends StatelessWidget {
  const AlbumCell(this.album);

  @required
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: ClipRRect(
              child: Hero(
                tag: "image${album.id}",
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/no_image.png",
                  image: album.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: Text(
              album.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: AppCustomStyles.titleFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
