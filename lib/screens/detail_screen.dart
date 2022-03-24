import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/provider/news_saved_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String content;
  final Timestamp time;

  static Route route(
      {@required String name,
      @required String image,
      @required String content,
      @required Timestamp time}) {
    return MaterialPageRoute(
        builder: (context) => DetailScreen(
              name: name,
              image: image,
              content: content,
              time: time,
            ));
  }

  const DetailScreen({Key key, this.name, this.image, this.content, this.time})
      : super(key: key);

  void showToat(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Đã lưu tin'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Chi tiết')), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        Consumer<NewsSavedProvider>(builder: (context, value, _) {
          return IconButton(
              onPressed: () {
                context.read<NewsSavedProvider>().addNew(News(
                    name: name, image: image, content: content, time: time));
                    // thông báo đã lưu
                    showToat(context);
              },
              icon: const Icon(Icons.save));
        })
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                formatterDate(time),
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Image.network(image),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatterDate(Timestamp time) {
  DateTime date = DateTime.parse(time.toDate().toString());
  String thu = weekFormatter(date.weekday);
  return thu +
      ", Ngày " +
      date.day.toString() +
      ",Tháng " +
      date.month.toString() +
      ",năm " +
      date.year.toString();
}

String weekFormatter(int value) {
  switch (value) {
    case 1:
      return 'Thứ 2';
    case 2:
      return 'Thứ 3';
    case 3:
      return 'Thứ 4';
    case 4:
      return 'Thứ 5';
    case 5:
      return 'Thứ 6';
    case 6:
      return 'Thứ 7';
    default:
      return 'Chủ nhật';
  }
}
