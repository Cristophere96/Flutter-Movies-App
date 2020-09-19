import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movies/constants.dart';
import 'package:movies/src/providers/moviesProviders.dart';
import 'package:movies/src/search/searchDelegate.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  final moviesProvider = new MoviesProviders();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopulars();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(
        moviesProvider: moviesProvider,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Movies'),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {
            showSearch(context: context, delegate: MovieSearch());
          },
        ),
      ],
    );
  }
}
