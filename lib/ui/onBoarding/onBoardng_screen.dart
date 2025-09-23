import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/OnBoarding_0.png",
      "title": "Find Your Next\n Favorite Movie Here",
      "desc":
      "Get access to a huge library of movies to suit all tastes.You will surely like it."
    },
    {
      "image": "assets/images/OnBoarding_1.png",
      "title": "Discover Movies",
      "desc":
      "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease."
    },
    {
      "image": "assets/images/OnBoarding_2.png",
      "title": "Explore All Genres",
      "desc":
      "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day."
    },
    {
      "image": "assets/images/OnBoarding_3.png",
      "title": "Create Watchlists",
      "desc":
      "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres."
    },
    {
      "image": "assets/images/OnBoarding_4.png",
      "title": "Rate, Review, and Learn",
      "desc":
      "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews."
    },
    {
      "image": "assets/images/OnBoarding_5.png",
      "title": "Start Watching Now",
      "desc": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final page = pages[index];
          return Stack(
            children: [
              // الصورة
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  page["image"]!,
                  fit: BoxFit.cover,
                ),
              ),

              // الكارت اللي تحت
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    color: AppColors.background,
                    child:  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          page["title"]!,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,

                        ),
                        SizedBox(height:height*0.02),

                      //  const SizedBox(height: 16),
                        Text(
                          page["desc"] ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height:height*0.02),

                        // الأزرار
                        if (currentPage == 0)
                          ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: const Text("Explore now"),
                          )
                        else if (currentPage == pages.length - 1)
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(AppRoutes.login);
                                  // TODO: هنا يروح للـ Home
                                },
                                child: const Text("Finish"),
                              ),
                              SizedBox(height:height*0.02),
                              OutlinedButton(
                                onPressed: () {
                                  controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: const Text("Back"),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: const Text("Next"),
                              ),
                              SizedBox(height:height*0.02),
                              OutlinedButton(
                                onPressed: () {
                                  controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: const Text("Back"),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
