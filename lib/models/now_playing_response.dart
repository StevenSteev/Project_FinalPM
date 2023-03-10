// To parse this JSON data, do
//
//Datos y resultados de las peliculas

import 'dart:convert';

import 'movie.dart';

// CONSTRUCTOR (argumentos que se espera recibir)
class NowPlayingResponse {
  NowPlayingResponse({
    // Para quitar error se debe hacer obligatorio "required"
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;
  /* FACTORY CONSTRUCTOR
   Crea una instancia basada en Json que se recibe
   Sirve si se recibe directamente la respuesta.*/
  factory NowPlayingResponse.fromJson(String str) =>
      NowPlayingResponse.fromMap(json.decode(str));

  // Toma la instancia de la clase y crea un mapa: String toJson() => json.encode(toMap());

  // FACTORY CONSTRUCTOR
  factory NowPlayingResponse.fromMap(Map<String, dynamic> json) =>
      NowPlayingResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        // Se recibe un listado y se crea instancias de movie
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toMap() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
