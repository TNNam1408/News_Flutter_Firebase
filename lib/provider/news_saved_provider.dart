import 'package:flutter/cupertino.dart';
import 'package:news/model/news.dart';

class NewsSavedProvider extends ChangeNotifier {
  List<News> news =  [];

  void addNew(News n) {


    var index = news.indexOf(n);

   if(index == -1){
     news.add(n);
     notifyListeners();
   }

  }

  void deleteNew(News n) {
    var index = news.indexOf(n);

   if(index != -1){
     news.removeAt(index);
     notifyListeners();
   }
  }

}