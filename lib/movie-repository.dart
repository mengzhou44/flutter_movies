import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;

import 'movie-list-model.dart';
 
class MovieRepository {
  final String _apiKey='498426632247b3e8abf18a6d4577b1c6';
  Client client = Client(); 
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<MovieListModel> fetchAllMovies() async {
    Response response;
    if(_apiKey != 'api-key') {
       response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      return MovieListModel.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

}

