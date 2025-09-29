import 'package:flutter/material.dart';
import 'package:movie_app/core/models/MovieList.dart';
import 'package:movie_app/core/repo/api_manager.dart';

class MoviesViewModel extends ChangeNotifier{
  //بيرث من ChangeNotifier عشان نقدر نعمل notifyListeners() لأي widget مستمع للـ ViewModel ده، وده بيخلي الـ UI يتحدث تلقائيًا لما البيانات تتغير.
  bool isLoading =false;
  String?errorMessage;
  List<Movies>?movies;
  //isLoading: حالة التحميل. لو true، نقدر نعرض Loading Indicator على الشاشة.
  // errorMessage: لو حصل خطأ أثناء جلب البيانات، هنا نخزن الرسالة.
  // movies: القائمة اللي هتحمل فيها الأفلام بعد استدعاء API.


 Future <void> fetchMovies({String? genre})async{
   //ممكن تاخد optional parameter اسمه genre عشان تجيب أفلام بنوع معين.
    try{

      isLoading=true;
      notifyListeners();
      //قبل ما نبدأ جلب البيانات، بنخلي isLoading = true عشان UI يعرف يعرض Loading.
      // notifyListeners() مهم جدًا هنا، لأنه بيخلي أي Widget مستمع للـ ViewModel يتحدث ويعرض الـ Loading Indicator.

  MovieList? result= await ApiManager.getMovies(type: genre);
movies = result?.data?.movies;
      errorMessage=null;
      //هنا بنستدعي API عن طريق ApiManager.getMovies.
      // النتيجة بنحطها في movies.
      // لو نجحنا، بنمسح أي رسائل خطأ errorMessage = null.

    }catch(e){
      errorMessage=e.toString();
    }finally{
      isLoading=false;
      notifyListeners();
      //سواء نجح الاستدعاء أو حصل خطأ، لازم نوقف الـ Loading.
      // notifyListeners() هنا مهم جدًا عشان الـ UI يعرف يخفف الـ Loading Indicator ويعرض البيانات أو رسالة الخطأ.
    }
  }

}