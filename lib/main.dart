import 'package:flutter/material.dart';
import 'package:news/provider/database.dart';
import 'package:news/provider/news_saved_provider.dart';
import 'package:news/provider/seen_provider.dart';
import 'package:news/router/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Database>(
            create: (ctx) => Database(),
          ),

          ChangeNotifierProvider<NewsSavedProvider>(
            create: (ctx) => NewsSavedProvider(),
          ),


           ChangeNotifierProvider<SeenProvider>(
            create: (ctx) => SeenProvider(),
          ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }
}
