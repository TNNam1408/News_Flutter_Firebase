import 'package:flutter/material.dart';
import 'package:news/model/news.dart';

class SeenProvider extends ChangeNotifier {
  List<News> news =  [];

  void addNew(News n) {
    var index = news.indexOf(n);

   if(index == -1){
     news.add(n);
     notifyListeners();
   }
  }

  void deleteNew(News n) {
    news.remove(n);
    notifyListeners();
  }

}