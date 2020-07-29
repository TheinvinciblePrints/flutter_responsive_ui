import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/services/network/network_provider.dart';
import 'package:flutter_responsive_ui/utils/app_constants.dart';
import 'package:flutter_responsive_ui/viewmodels/albums_view_model.dart';
import 'package:flutter_responsive_ui/views/base/base_view.dart';
import 'package:flutter_responsive_ui/views/pages/home_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<AlbumViewModel>(
      builder: (context, child, model) => Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          title: new Text(
            '${AppConstants.APP_TITLE}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Provider<NetworkProvider>(
          builder: (context) => NetworkProvider(),
          child: Consumer<NetworkProvider>(
            builder: (context, value, _) => Center(
              child: HomePage(
                networkProvider: value,
                viewModel: model,
                context: context,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
