import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_moviles/models/movie.dart';
import 'package:peliculas_moviles/models/now_playing_response.dart';
import 'package:peliculas_moviles/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';
  List<Movie> onDisplayMovies = [];
  List<Movie> PopularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  //asincrono espera respuesta del servidor
  getOnDisplayMovies() async {
    //peticion construida
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

//respuesta de un json con un valor string y luego un dynamico
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);

    //impresion de la respuesta
    //print(decodeData);
    //print(response.body);
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    //Le comunica a todos los windgets que estan escuchando que se cambio toda la
    //data por lo tanto se tienen que redibujar
    notifyListeners();
    print(nowPlayingResponse.results[0].title);
    //print(PopularResponse.results);
  }

  //consumir el servicio

  getPopularMovies() async {
    //peticion construida
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);

    final popularResponse = PopularResponse.fromRawJson(response.body);

    //Destructurar resultado para camibar pagia y mantener los actuales

    PopularMovies = [...PopularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
