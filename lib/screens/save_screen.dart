
import 'package:flutter/material.dart';
import 'package:news/provider/news_saved_provider.dart';
import 'package:news/widgets/listnews.dart';
import 'package:news/widgets/listsave.dart';
import 'package:provider/provider.dart';
class SaveScreen extends StatelessWidget {


  static Route route() {
    return MaterialPageRoute(builder: (context) =>  const SaveScreen());
  }
  const SaveScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tin đã lưu"),
        backgroundColor: Colors.green,
      ),
      body: ListSave(
            name: 'Tin đã lưu',
            snapShot: context.watch<NewsSavedProvider>().news,
          ),
    );
  }
}
