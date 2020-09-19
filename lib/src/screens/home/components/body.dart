import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

import 'package:movies/src/providers/moviesProviders.dart';

import 'nowPlayingCarousel.dart';
import 'popularMoviesCarousel.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.moviesProvider,
  }) : super(key: key);

  final MoviesProviders moviesProvider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildSubtitle(context, 'In Theater'),
          NowPlayingCarousel(moviesProvider: moviesProvider),
          SizedBox(height: kDefaultPadding),
          buildSubtitle(context, 'Popular Movies'),
          PopularMoviesCarousel(moviesProvider: moviesProvider),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }

  Padding buildSubtitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kTextColor,
                ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            height: 6,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
