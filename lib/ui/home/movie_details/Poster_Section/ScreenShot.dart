import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class Screenshot extends StatelessWidget {
  final List<String>screenShots;

  Screenshot({super.key, required this.screenShots});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      children: [
        Text("Screenshots", style: Theme
            .of(context)
            .textTheme
            .bodyLarge,),
        SizedBox(height: height * 0.02,),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final url = screenShots[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 180,
                      color: AppColors.bgCustomForm,
                      child: Center(child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded
                            / loadingProgress.expectedTotalBytes! : null,
                      ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: AppColors.bgCustomForm,
                      child: Icon(
                        Icons.broken_image, color: AppColors.textPrimary,),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: height * 0.02,),
            itemCount: screenShots.length)
      ],
    );
  }
}
