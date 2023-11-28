import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/configs/app_settings.dart';
import 'package:algorithmx_dev/src/pages/home/home_page.dart';
//import 'package:algorithmx_dev/src/pages/home/welcome_page.dart';
//import 'package:algorithmx_dev/src/pages/info/info_page.dart';
import 'package:algorithmx_dev/src/pages/loading/loading_page.dart';
//import 'package:algorithmx_dev/src/pages/login/login_page.dart';
//import 'package:algorithmx_dev/src/pages/movie/movie_detail.dart';
//import 'package:algorithmx_dev/src/pages/movie/upcoming_movie_page.dart';
//import 'package:algorithmx_dev/src/pages/sign_up/sign_up_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:splash_view/splash_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Container(
              color: Colors.white,
            );
          } else {
            final token = snapshot.data?.getString(AppSettings.userNameSetting);
            if(token != null) {
              return HomePage();
            }else {
              return LoadPage();
            }
          }
        },
      ),
    //   SplashView(
    //   backgroundColor: Colors.red,
    //   loadingIndicator: RefreshProgressIndicator(),
    //   logo: SizedBox(
    //     child: Image.asset('assets/algorithmx-2.png'),
    //     width: 200,
    //   ),
    //   done: Done(WelcomePage()),
    // ),
      routes: AppRoute().getAll,
    );
  }
}



