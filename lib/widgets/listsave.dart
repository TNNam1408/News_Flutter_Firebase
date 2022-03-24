import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/widgets/singlenews.dart';
import 'package:news/widgets/singlesave.dart';

class ListSave extends StatelessWidget {
  final String name;
  final List<News> snapShot;
  const ListSave({Key key,this.name,this.snapShot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      //
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 600,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: snapShot
                    .map(
                      (e) => SingleSave(
                    name: e.name,
                    image: e.image,
                    content: e.content,
                    time: e.time,
                  ),
                )
                    .toList(),

              ),
            ),
          ],
        ),
      ],
    );
  }
}