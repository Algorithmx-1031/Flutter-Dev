
import 'package:algorithmx_dev/src/pages/game/game_management_page.dart';
import 'package:algorithmx_dev/src/pages/game/game_page.dart';
import 'package:algorithmx_dev/src/pages/home/home_page.dart';
import 'package:algorithmx_dev/src/pages/home/welcome_page.dart';
import 'package:algorithmx_dev/src/pages/info/info_page.dart';
import 'package:algorithmx_dev/src/pages/login/login_page.dart';
import 'package:algorithmx_dev/src/pages/map/map_page.dart';
import 'package:algorithmx_dev/src/pages/movie/movie_detail.dart';
import 'package:algorithmx_dev/src/pages/movie/upcoming_movie_page.dart';
import 'package:algorithmx_dev/src/pages/movie/video_page.dart';
import 'package:algorithmx_dev/src/pages/popular_page.dart';
import 'package:algorithmx_dev/src/pages/scan/scan_page.dart';
import 'package:algorithmx_dev/src/pages/top_rated.dart';
import 'package:flutter/cupertino.dart';

import '../pages/popular/popular_list.dart';

class AppRoute{
  static const homeRoute = "home";
  static const infoRoute = "info";
  static const loginRoute = "login";
  static const upcomingRoute = "upcoming";
  static const movieRoute = "movie";
  static const videoRoute = "video";
  static const welcomeRoute = "welcome";
  static const scanRoute = "scan";
  static const newsRoute = "news";
  static const gamesRoute = "games";
  static const mapRoute = "map";
  static const gameManagementRoute = "gameManagement";
  static const popularRoute = "popular";
  static const topRatedRoute = "topRated";

  final _route = <String, WidgetBuilder> {
    homeRoute : (context) => HomePage(),
    infoRoute : (context) => InfoPage(),
    loginRoute : (context) => LoginPage(),
    upcomingRoute : (context) => UpcomingMoviePage(),
    movieRoute : (context) => MovieDetailPage(),
    videoRoute : (context) => VideoPage(),
    welcomeRoute : (context) => WelcomePage(),
    scanRoute : (context) => ScanPage(),
    newsRoute : (context) => NewsPage(),
    gamesRoute : (context) => GamePage(),
    mapRoute : (context) => MapPage(),
    gameManagementRoute : (context) => GameManagementPage(),
    popularRoute : (context) => PopularPage(),
    topRatedRoute : (context) => TopRatedPage(),
      
    };

  get getAll => _route;
}