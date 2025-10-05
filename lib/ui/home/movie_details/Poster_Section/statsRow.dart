import 'package:flutter/material.dart';
import 'package:movie_app/core/models/MovieDetails.dart';
import 'package:movie_app/core/utils/app_assets.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class StatsRow extends StatelessWidget {
  final Movie movie;

  const StatsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildState(Image.asset(AppAssets.star, ), "${movie.rating ?? 0.0}"),
          buildState(Image.asset(AppAssets.time, ), "${movie.runtime ?? 0} min"),
          buildState(Image.asset(AppAssets.love, ), "${movie.likeCount ?? 0}"),
        ],
      ),
    );
  }

  Widget buildState(Widget icon, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgCustomForm,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
           SizedBox(width: 6),
          Text(value, style: AppStyles.bold24White
          )],
      ),
    );
  }
}
