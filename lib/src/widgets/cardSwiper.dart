import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/constants.dart';
import 'package:movies/src/models/movieModel.dart';

class CardSwiper extends StatelessWidget {
  
  final List<Movie> movies;

  CardSwiper({ @required this.movies });
  
  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.5,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {

          movies[index].uniqueId = '${movies[index].id}-card';

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Hero(
              tag: movies[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  child: FadeInImage(
                    image: NetworkImage(movies[index].getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'detail', arguments: movies[index]);
                  },
                )
              ),
            ),
          );
        },
        itemCount: movies.length,
        itemWidth: _screenSize.width * 0.7,
        viewportFraction: 0.6,
      ),
    );
  }
}