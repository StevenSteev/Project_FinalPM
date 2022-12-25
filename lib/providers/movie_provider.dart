import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'dart:convert';

import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseURL = 'api.themoviedb.org';
  String _apiKey = '8d6ed2ec2251fc94ee265133935c8d8f';
  String _language = 'es-ES';
  // Lista donde se almacenará pelis
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  // Para incrementar en 1 el scroll del POPULAR
  int _popularPage = 0;
  // Lista de actores Id:Peli
  Map<int, List<Cast>> moviesCast = {};

  MoviesProvider() {
    print('Movie Provider inicializado');
    // This (opcional), metodo se llama
    this.getOnDisplayMovie();
    this.getPopularMovie();
  }