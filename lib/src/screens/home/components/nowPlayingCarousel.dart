import 'package:flutter/material.dart';
import 'package:movies/src/providers/moviesProviders.dart';
import 'package:movies/src/widgets/cardSwiper.dart';

class NowPlayingCarousel extends StatelessWidget {
  const NowPlayingCarousel({
    Key key,
    @required this.moviesProvider,
  }) : super(key: key);

  final MoviesProviders moviesProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper( movies: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }
}