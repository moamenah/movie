import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/ui/home/movies_screen/movies_screen.dart';
import 'package:movie_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    // نسخة الـ Carousel (كل الأفلام)
    final allMoviesVM = Provider.of<MoviesViewModel>(context,listen: true);
    //3️⃣ الفرق بين listen: true و listen: false
    // listen: true → أي تغيير في الـ ViewModel هيحدث الـ widget تلقائيًا (مثلاً Loading أو عرض الأفلام).
    // listen: false → بتاخد نسخة من الـ ViewModel بس بدون ما الـ widget يتحدث تلقائيًا.
    // مفيد لو عايز تنفذ دوال زي fetchMovies() بدون إعادة بناء الـ widget.
    // نسخة الأكشن
    final actionMoviesVM = Provider.of<MoviesViewModel>(context, listen: true);
    final comedyVM = Provider.of<MoviesViewModel>(context, listen: true);





    // حالة التحميل
    if (allMoviesVM.isLoading || comedyVM.isLoading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
    }

    // حالة الخطأ
    if (allMoviesVM.errorMessage != null || comedyVM.errorMessage != null) {
      return Center(
        child: Text(
          allMoviesVM.errorMessage ?? comedyVM.errorMessage ?? "Error",
          style:  AppStyles.regular16White,
        ),
      );
    }

    return ListView(
      padding:  EdgeInsets.all(16),
      children: [
        // ================= Available Now =================
        Image.asset(AppAssets.Available_Now),
         SizedBox(height:height*0.02),

        // ================= Carousel =================
        CarouselSlider(
          options: CarouselOptions(
            height: 351,
            enlargeCenterPage: true,
            viewportFraction: 0.6,
            enableInfiniteScroll: true,
          ),
          items: allMoviesVM.movies?.map((movie) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.mediumCoverImage ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(9),
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
                       SizedBox(width: width*0.01),
                      const Icon(Icons.star, color: AppColors.primary, size: 15),
                    ],
                  ),
                ),
              ],
            );
          }).toList() ?? [],
        ),
Image.asset(AppAssets.Watch_Now),
        // ================= Action Section =================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Romance", style: AppStyles.regular20White),
            TextButton(
              onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(builder:(context) => MoviesScreen(genre: 'Romance',),));

              },
              child: Row(
                children: [
                  Text("See More", style: AppStyles.regular16WPrimary),
                  const Icon(Icons.arrow_forward, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
         SizedBox(height: height*0.02),

        // ================= Action Movies List =================
        SizedBox(
          height: 220,
          width: 146,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: comedyVM.movies?.length ?? 0,
            separatorBuilder: (_, __) =>  SizedBox(width: width*0.02),
            itemBuilder: (context, index) {
              final movie = comedyVM.movies![index];
              return Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      movie.mediumCoverImage ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(10),
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
        ),
      ],
    );
  }
}
