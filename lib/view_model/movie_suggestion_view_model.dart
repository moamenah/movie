import 'package:flutter/material.dart';
import 'package:movie_app/core/models/MovieList.dart';
import 'package:movie_app/core/repo/api_manager.dart';

class MovieSuggestionsViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<Movies>? suggestions; // الأفلام المقترحة

  Future<void> fetchMovieSuggestions(int movieId) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await ApiManager.getMovieSuggestions(movieId);

      suggestions = result?.data?.movies;

      // suggestions = result?.data?.movies
      //     ?.map((e) => Movies.fromJson(e))
      //     .toList();


      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
