// import 'package:movie_app/core/models/MovieList.dart';
// import 'package:movie_app/core/repo/api_manager.dart';
// import 'package:flutter/material.dart';
//
//
// class ActionMovieViewModel extends ChangeNotifier {
//   bool isLoading = false;
//   String? errorMessage;
//   List<Movies>? movies;
//
//   Future<void> fetchActionMovies() async {
//     try {
//       isLoading = true;
//       notifyListeners();
//
//       final result = await ApiManager.getMovies(type: "Action");
//       movies = result?.data?.movies;
//       errorMessage = null;
//     } catch (e) {
//       errorMessage = e.toString();
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
