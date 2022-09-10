import 'package:flutter/material.dart';
import 'package:maybelline/core/enum/viewstate.dart';
import 'package:maybelline/core/viewmodels/home_model.dart';
import 'package:maybelline/ui/Views/base_view.dart';
import 'package:maybelline/ui/shared/app_colors.dart';
import 'package:maybelline/ui/shared/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReeady: (model) => model.fetchProducts(),
      builder: (BuildContext context, HomeModel model, Widget? child) =>
          Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Here are all your posts',
                      style: subHeaderStyle,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
