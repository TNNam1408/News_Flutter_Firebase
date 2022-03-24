import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/provider/database.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../widgets/listnews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Database databaseProvider;

class _HomeScreenState extends State<HomeScreen> {

  Widget _BuildTinNong() {
    List<News> tinnong = databaseProvider.getTinNongList;
    return ListNews(name: 'Tin nóng', snapShot: tinnong);
  }

  Widget buildButtonTinnong() {
    return Consumer<ValueNotifier<String>>(builder: (context, page, child) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: const Text(
            'Tin nóng',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          context.read<ValueNotifier<String>>().value = 'tinnong';
        },
      );
    });
  }

  Widget buildButtonSanPhamSo() {
    return Consumer<ValueNotifier<String>>(builder: (context, page, child) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: const Text(
            'Sản phẩm số',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          context.read<ValueNotifier<String>>().value = 'sanphamso';
        },
      );
    });
  }

  Widget buildButtonCuocSongSo() {
    return Consumer<ValueNotifier<String>>(builder: (context, page, child) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: const Text(
            'Cuộc sống số',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          context.read<ValueNotifier<String>>().value = 'cuocsongso';
        },
      );
    });
  }

  Widget buildButtonBaoMat() {
    return Consumer<ValueNotifier<String>>(builder: (context, page, child) {
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: const Text(
            'Bảo mật',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          context.read<ValueNotifier<String>>().value = 'baomat';
        },
      );
    });
  }

  Widget _BuildSanPhamSo() {
    List<News> sanphamso = databaseProvider.getSanPhamSoList;
    return ListNews(
      name: "Sản Phẩm Số",
      snapShot: sanphamso,
    );
  }

  Widget _BuildCuocSongSo() {
    List<News> cuocsongso = databaseProvider.getCuocSongSoList;
    return ListNews(
      name: "Cuộc Sống Số",
      snapShot: cuocsongso,
    );
  }

  Widget _BuildBaoMat() {
    List<News> baomat = databaseProvider.getBaoMatList;
    return ListNews(
      name: "Bảo Mật",
      snapShot: baomat,
    );
  }

  Widget _buildCategory() {
    return Container(
      color: Colors.green,
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButtonTinnong(),
            buildButtonSanPhamSo(),
            buildButtonCuocSongSo(),
            buildButtonBaoMat()
          ],
        ),
      ),
    );
  }

  Widget _buildBodyHomepage() {
    return Expanded(
      child: Consumer<ValueNotifier<String>>(builder: (context, page, child) {
        switch (page.value) {
          case "tinnong":
            return _BuildTinNong();
          case "cuocsongso":
            return _BuildCuocSongSo();
          case "sanphamso":
            return _BuildSanPhamSo();
          default:
            return _BuildBaoMat();
        }
      }),
    );
  }

  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: Text(
      'Đánh giá ứng dụng',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Hãy đánh giá 5 sao nếu bạn thấy ứng dụng có ích',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image: const FlutterLogo(size: 100),
    submitButtonText: 'Gửi đánh giá',
    commentHint: 'Đặt gợi ý nhận xét tùy chỉnh của bạn',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        return Text("Error");
      }
    },
  );

  Widget _buidldDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blueGrey[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Nội dung",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                      Navigator.of(context).pushNamed('/save');
                    },
                    child: const Text(
                      "Tin đã lưu",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                      Navigator.of(context).pushNamed('/seen');
                    },
                    child: const Text(
                      "Tin đã xem",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Sản phẩm",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                      showDialog(
                        context: context,
                        barrierDismissible:
                            true, // set to false if you want to force a rating
                        builder: (context) => _dialog,
                      );
                    },
                    child: const Text(
                      "Đánh giá ứng dụng",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openEndDrawer();
                      Navigator.of(context).pushNamed('/send');
                    },
                    child: const Text(
                      "Gửi Email báo cáo",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    databaseProvider = Provider.of<Database>(context);
    databaseProvider.getTinNongData();
    databaseProvider.getTinNongNameData();
    databaseProvider.getSanPhamSoData();
    databaseProvider.getSanPhamSoNameData();
    databaseProvider.getCuocSongSoData();
    databaseProvider.getCuocSongSoNameData();
    databaseProvider.getBaoMatData();
    databaseProvider.getBaoMatNameData();
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buidldDrawer(context),
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      body: ChangeNotifierProvider<ValueNotifier<String>>(
        create: (context) => ValueNotifier<String>("tinnong"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildCategory(), _buildBodyHomepage()],
        ),
      ),
    );
  }
}
