import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/models/album.dart';

class GridDetails extends StatefulWidget {
  final Album curAlbum;

  GridDetails({@required this.curAlbum});

  @override
  GridDetailsState createState() => GridDetailsState();
}

class GridDetailsState extends State<GridDetails> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: "assets/images/no_image.png",
              image: widget.curAlbum.url,
            ),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
