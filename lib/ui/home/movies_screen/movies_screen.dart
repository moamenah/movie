import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  final String genre; // النوع اللي هيعرضه
  const MoviesScreen({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final moviesVM = MoviesViewModel();
    moviesVM.fetchMovies(genre: genre);

    return ChangeNotifierProvider<MoviesViewModel>(
      create: (_) => moviesVM,
      child: Consumer<MoviesViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) return const Center(child: CircularProgressIndicator());
          if (vm.errorMessage != null)
            return Center(
              child: Text(vm.errorMessage!, style: AppStyles.regular16White),
            );

          return Scaffold(
            appBar: AppBar(title: Text("$genre Movies")),
            backgroundColor: AppColors.background,
            body: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,       // عدد الأفلام في الصف
                crossAxisSpacing: 12,    // المسافة أفقياً
                mainAxisSpacing: 12,     // المسافة رأسياً
                childAspectRatio: 0.7,   // نسبة ارتفاع/عرض كل عنصر
              ),
              itemCount: vm.movies?.length ?? 0,
              itemBuilder: (context, index) {
                final movie = vm.movies![index];
                return Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        movie.mediumCoverImage ?? "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.background,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movie.rating?.toString() ?? "0",
                            style: AppStyles.regular16White,
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, color: AppColors.primary, size: 15),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
