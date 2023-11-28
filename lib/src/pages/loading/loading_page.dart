
import 'package:algorithmx_dev/src/pages/home/welcome_page.dart';
// import 'package:algorithmx_dev/src/pages/login/login_page.dart';
// import 'package:algorithmx_dev/src/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Container(
            height: 1000,
            alignment: Alignment.center,
            child: Image.asset('assets/algorithmx.png',
            fit: BoxFit.fitHeight,)

          )
        ],
      ),
    );
  }
}
