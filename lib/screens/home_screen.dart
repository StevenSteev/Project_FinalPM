import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:peliculas/widgets/widgets.dart';

import 'package:provider/provider.dart';
import 'package:peliculas/search/delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  listener,no dependencia,
    final moviesProvider = Provider.of<MoviesProvider>(context);

    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text('PELISTEV'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                // BUSQUEDA
                showSearch(context: context, delegate: MovieSearchDelegate());
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      // HACER SCROLL
      body: SingleChildScrollView(
          child: Column(
        children: [
          //TARJETAS PRINCIPALES: TODO CardSwiper
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          //SLIDER DE PELICULAS: Listado horizontal de películas
          MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares en Cartelera',
              onNextPage: () => moviesProvider.getPopularMovie()),
        ],
      )),
    );
  }
}
