import 'package:flutter/material.dart';

import 'package:movies/src/providers/moviesProviders.dart';
import 'package:movies/src/models/movieModel.dart';

class MovieSearch extends SearchDelegate{

  String selection = '';
  final moviesProvider = new MoviesProviders();
  
  final movies = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam',
    'Ironman',
    'Captain America',
  ];

  final recentMovies = ['Spiderman', 'Captain America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Our Appbar Icons
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Our left icon on the Appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Create the resulut we are going to show
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.amberAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions as the user types
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
            children: movies.map((e) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(e.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  width: 50.0,
                ),
                title: Text(e.title),
                subtitle: Text(e.releaseDate),
                onTap: () {
                  close(context, null);
                  e.uniqueId = '';
                  Navigator.pushNamed(context, 'detail', arguments: e);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
}