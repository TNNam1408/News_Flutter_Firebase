import 'package:flutter/material.dart';
import 'package:news/provider/seen_provider.dart';
import 'package:news/widgets/listnews.dart';
import 'package:provider/provider.dart';

class SeenScreen  extends StatelessWidget {

  const SeenScreen({Key key}) : super(key: key);



  static Route route() {
    return MaterialPageRoute(builder: (context) =>   const SeenScreen());
  }

  @override
  Widget build(BuildContext context) {
     var saveList = context.watch<SeenProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tin đã Xem"),

        backgroundColor: Colors.green,
      ),
      body: ListNews(
            name: 'Tin đã xem',
            snapShot: saveList.news,
          ),
    );
  }

}