import 'package:movie_app/core/models/MovieDetails.dart';
import 'package:movie_app/core/repo/api_manager.dart';
import 'package:flutter/material.dart';


class MovieDetailsViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  MovieDetails? movieDetails;

  Future<void> fetchMovieDetails(int movieId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      movieDetails = await ApiManager.getMovieDetails(movieId);

    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
