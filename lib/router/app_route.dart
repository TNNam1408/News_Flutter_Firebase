import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:news/screens/detail_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/login_screen.dart';
import 'package:news/screens/save_screen.dart';
import 'package:news/screens/seen_screen.dart';
import 'package:news/screens/send_email_screen.dart';
import 'package:news/screens/signup_screen.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/':
        return LoginScreen.route();
      case '/login':
        return LoginScreen.route();
      case '/signup':
        return SignUpScreen.route();
      case '/home':
        return HomeScreen.route();
      case '/save':
        return SaveScreen.route();
      case '/seen':
        return SeenScreen.route();
      case '/send':
        return SendEmailScreen.route();
        break;
      case '/detail':
        final news = settings.arguments as News;
        return DetailScreen.route(
            image: news.image,
            content: news.content,
            name: news.name,
            time: news.time);
      default:
        return null;
    }
  }
}
