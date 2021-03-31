import 'dart:convert';

import 'package:faster/models/api_models.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class HomeStore {


  Future<Body> fetchList() async {
    final result = await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=ru-Ru'));
    print('result: ${result.statusCode}');
    if (result.statusCode == 200) {
      final jsonResult = json.decode(result.body);
      final body = Body.fromJson(jsonResult);
      return body;
    }
    return null;
  }
}