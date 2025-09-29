import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/models/MovieList.dart';
import 'package:movie_app/core/repo/api_const.dart';
import 'package:movie_app/core/repo/endpoint.dart';

class ApiManager{


  static Future<MovieList?> getMovies({String? type}) async {
    try {
      // هنا نكون الـ URL
      // هنا نكون الـ URL مع query parameters

      Uri url = Uri.https(
          ApiConst.baseUrl,
          EndPoint.listMovies,
      type!=null?{"genre":type}:null
      );

      // نطلب البيانات
      final response = await http.get(url);

      // نتأكد إن الرد ناجح
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(response.body);

        // نرجع الـ Model
        return MovieList.fromJson(jsonBody);
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }







static Future<MovieList?> getDetailsMovies(int movieId) async {
  Uri url = Uri.https(
    ApiConst.baseUrl,
    EndPoint.movieEndPointDetails,
    {
      'movie_id': movieId.toString(),
      'with_images': 'true',
      'with_cast': 'true',
    },
  );

  try {
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return MovieList.fromJson(jsonData);
  } catch (e) {
    throw e;
  }
}





}