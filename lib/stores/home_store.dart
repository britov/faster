import 'dart:async';
import 'dart:convert';

import 'package:faster/models/api_models.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../config.dart';

class HomeStore {
  final _movies = StreamController<MovieBody>.broadcast();
  Stream<MovieBody> get movies => _movies.stream;

  final _video = StreamController<VideoBody>.broadcast();
  Stream<VideoBody> get video => _video.stream;

  void dispose() {
    _video.close();
    _movies.close();
  }

  Future<MovieBody> fetchList() async {
    final result = await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=ru-Ru'));
    print('result: ${result.statusCode}');
    if (result.statusCode == 200) {
      final jsonResult = json.decode(result.body);
      final body = MovieBody.fromJson(jsonResult);
      _movies.add(body);
      return body;
    }
    return null;
  }

  Future<void> selectMovie(Movie movie) async {
    await _getVideo(movie.id);
  }

  Future<VideoBody> _getVideo(num id) async {
    final result = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey'));
    print('result: ${result.statusCode}');
    if (result.statusCode == 200) {
      final jsonResult = json.decode(result.body);
      final body = VideoBody.fromJson(jsonResult);
      _video.add(body);
      return body;
    }
    return null;
  }
}