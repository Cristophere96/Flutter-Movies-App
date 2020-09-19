import 'package:flutter/material.dart';

import 'package:movies/src/providers/moviesProviders.dart';
import 'package:movies/src/widgets/movieHorizontal.dart';

class PopularMoviesCarousel extends StatelessWidget {
  const PopularMoviesCarousel({
    Key key,
    @required this.moviesProvider,
  }) : super(key: key);

  final MoviesProviders moviesProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder(
            stream: moviesProvider.popularsStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  movies: snapshot.data,
                  nextPage: moviesProvider.getPopulars,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}