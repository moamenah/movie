import 'package:flutter/material.dart';
import 'package:movie_app/ui/home/movie_details/Poster_Section/PosterSection.dart';
import 'package:movie_app/ui/home/movie_details/Poster_Section/ScreenShot.dart';
import 'package:movie_app/ui/home/movie_details/Poster_Section/statsRow.dart';
import 'package:movie_app/view_model/movie_Details_view_model.dart';
import 'package:movie_app/view_model/movie_suggestion_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsVM = Provider.of<MovieDetailsViewModel>(context);
    final suggestionsVM = Provider.of<MovieSuggestionsViewModel>(context);

    // حالة الـ Loading
    if (detailsVM.isLoading || suggestionsVM.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // حالة الـ Error
    if (detailsVM.errorMessage != null || suggestionsVM.errorMessage != null) {
      return Center(
        child: Text(
          detailsVM.errorMessage ?? suggestionsVM.errorMessage ?? "Error",
        ),
      );
    }

    final movie = detailsVM.movieDetails?.data?.movie;
    final similar = suggestionsVM.suggestions;

    if (movie == null) {
      return const Center(child: Text("No details available"));
    }

    // 📌 الترتيب النهائي للـ UI
    return CustomScrollView(
      slivers: [

        SliverToBoxAdapter(child: PosterSection(movie: movie)),
        SliverToBoxAdapter(child: StatsRow(movie: movie)),
        SliverToBoxAdapter(
          child: Screenshot(
            screenShots: [
              movie.mediumScreenshotImage1,
              movie.mediumScreenshotImage2,
              movie.mediumScreenshotImage3,
            ].whereType<String>().toList(),
          ),
        ),
        SliverToBoxAdapter(child: SuggestionsSection(suggestions: similar ?? [])),
        SliverToBoxAdapter(child: SummarySection(summary: movie.descriptionFull ?? "")),
        SliverToBoxAdapter(child: CastSection(cast: movie.cast ?? [])),
        SliverToBoxAdapter(child: GenresSection(genres: movie.genres ?? [])),

      ],
    );
  }
}
//🧠 ليه بنعمل .whereType<String>().toList() هنا؟
//
// عشان مش دايمًا كل الصور هتكون موجودة في الـ API — ممكن واحدة منهم تكون null.
// الفلتر ده بيتأكد إنك بتبعت للـ widget قائمة صور سليمة بدون قيم null.