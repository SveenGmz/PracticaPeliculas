import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';

  MoviesProvider() {
    getOnDisplayMovies();
  }
  //asincrono espera respuesta del servidor
  getOnDisplayMovies() async {
    //peticion construida
    var url = Uri.https(_baseUrl, '3/movie/nowplaying',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

//respuesta de un json con un valor string y luego un dynamico
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);

    //impresion de la respuesta
    print(decodeData);
    print(response.body);
  }
}
