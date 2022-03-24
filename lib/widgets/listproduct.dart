import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/widgets/singleproduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final List<News> snapShot;
  const ListProduct({Key key,this.name,this.snapShot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       name,
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     backgroundColor: Colors.transparent,
    //     elevation: 0.0,
    //     iconTheme: const IconThemeData(color: Colors.black),
    //   ),
    //   body: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 10),
    //     child: ListView(
    //       children: [
    //         Column(
    //           children: [
    //             Container(
    //               height: 50,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         name,
    //                         style: const TextStyle(
    //                             fontSize: 17,
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                       //
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             Container(
    //               height: 600,
    //               child: ListView(
    //                 scrollDirection: Axis.vertical,
    //                 children: snapShot
    //                     .map(
    //                       (e) => SingleProduct(
    //                     name: e.name,
    //                     image: e.image,
    //                     content: e.content,
    //                     time: e.time,
    //                   ),
    //                 )
    //                     .toList(),
    //
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );

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
                      (e) => SingleProduct(
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