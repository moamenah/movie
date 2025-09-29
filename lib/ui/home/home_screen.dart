import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/ui/home/explore_tab.dart';
import 'package:movie_app/ui/home/home_tab.dart';
import 'package:movie_app/ui/home/profile_tab.dart';
import 'package:movie_app/ui/home/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  late final List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    // ده اللي initState() بيعمله: ترتيب وتجهيز كل اللي محتاج قبل ما الويدجت يظهر على الشاشة لأول مرة.
    tabs = [
      const HomeTab(),   // أول تب هيبقى HomeTab
      const SearchTab(),
      const ExploreTab(),
      const ProfileTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: tabs[currentIndex],  // عرض التب حسب currentIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
