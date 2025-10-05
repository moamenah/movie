import 'package:flutter/material.dart';
import 'package:movie_app/core/models/MovieDetails.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/ui/register_screen/custom_elevated_button.dart';

class PosterSection extends StatelessWidget {
 final Movie movie;

   PosterSection({super.key,required this.movie });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: Stack(
        children: [
          Image.network(
            movie.largeCoverImage ?? "",
            fit: BoxFit.cover,
            width: double.infinity,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed:(){
Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back, color: AppColors.textPrimary)),
                IconButton(onPressed: (){

                },
                    icon:Icon(Icons.bookmark, color: AppColors.textPrimary),
                )
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.slow_motion_video_outlined,
                  size: 100,
                  color: AppColors.primary,),
                SizedBox(height: height*0.2,),
                Text(movie.title??"No Title",style: Theme.of(context).textTheme.bodyLarge,),
                Text(movie.year?.toString()??"No Year"),
              ],
            ),
          ),
CustomElevatedButton(onPressed: (){}, text:"Watch")
        ],
      ),
    );
  }
}
