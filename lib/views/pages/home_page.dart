import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/services/network/network_provider.dart';
import 'package:flutter_responsive_ui/utils/custom_styles.dart';
import 'package:flutter_responsive_ui/viewmodels/albums_view_model.dart';
import 'package:flutter_responsive_ui/views/widgets/lanscape_panel.dart';
import 'package:flutter_responsive_ui/views/widgets/no_internet_connection.dart';
import 'package:flutter_responsive_ui/views/widgets/portrait_panel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final NetworkProvider networkProvider;
  final AlbumViewModel viewModel;
  final BuildContext context;

  HomePage({@required this.networkProvider, this.viewModel, this.context});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _toggleTexts = ['1', '2'];

  @override
  void dispose() {
    widget.networkProvider.disposeStreams();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityResult>.value(
      stream: widget.networkProvider.networkStatusController.stream,
      child: Consumer<ConnectivityResult>(
        builder: (context, value, model) {
          Widget container = NoInternetConnection();

          if (value == null) {
            container = Container();

            return container;
          }

          if (value != ConnectivityResult.none) {
            container = Container(
              child: Column(
                children: <Widget>[
                  _toggleButtons(widget.viewModel),
                  _bodyUI(),
                ],
              ),
            );
          }

          return container;
        },
      ),
    );
  }

  Widget _toggleButtons(AlbumViewModel model) {
    return Column(
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 20.0, left: 0.0, right: 0.0, bottom: 6.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ToggleButtons(
                  borderColor: Colors.transparent,
                  // fillColor: '#dfeef9'.toColor(),
                  fillColor: Colors.blue[100],
                  borderWidth: null,
                  selectedBorderColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  children: <Widget>[
                    toggleItems(_toggleTexts[0]),
                    toggleItems(_toggleTexts[1])
                  ],
                  onPressed: (int index) {
                    model.switchPage(index);
                  },
                  isSelected: model.isSelected,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget toggleItems(String text) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
      ),
      width: 20,
      height: 20,
      child: Center(
        child: Text(text,
            style: TextStyle().copyWith(
                fontSize: AppCustomStyles.smallFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.center),
      ),
    );
  }

  Widget _bodyUI() {
    return Expanded(
      child: pageChooser(widget.viewModel.selectedindex, widget.context),
    );
  }

  pageChooser(int page, BuildContext context) {
    switch (page) {
      case 0:
        return PortraitPanel();
        break;
      case 1:
        return LandscapePanel();
        break;
    }
  }
}
