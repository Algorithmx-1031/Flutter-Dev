import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  height: 1015,
                  alignment: Alignment.center,
                  // color: const Color(0xfffca9c42),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 1015,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage('assets/a.png'),
                            fit: BoxFit.cover,
                            opacity: 0.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                              width: 230,
                              child: Image(
                                image: AssetImage('assets/algorithmx_white.png'),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     IconButton(
                            //       icon: Icon(Icons.arrow_back_ios_rounded),
                            //       color: Colors.white,
                            //       iconSize: 28,
                            //       onPressed: () {
                            //         Navigator.pushNamed(context, 'loadpage');
                            //       },
                            //     ),
                            //     // Icon(
                            //     //   Icons.arrow_back_ios,
                            //     //   color: Colors.white,
                            //     // ),
                            //     SizedBox(
                            //       width: 110,
                            //     ),
                            //     const Text(
                            //       'Welcome',
                            //       style: TextStyle(
                            //           fontSize: 29,
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.w600),
                            //     ),
                            //     SizedBox(
                            //       width: 100,
                            //     ),
                            //     Text(
                            //       'ไทย/Eng',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.w500),
                            //     )
                            //   ],
                            // ),
                            const SizedBox(
                              height: 70,
                            ),
                            // Opacity(opacity: 0.5,
                            //   child: Card(
                            //     shape: const RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.vertical(
                            //           top: Radius.circular(50)
                            //       ),
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(30.0),
                            //       child: Column(
                            //         children: <Widget>[
                            //           const SizedBox(
                            //             height: 30,
                            //           ),
                            //           const Text(
                            //             'Login',
                            //             style: TextStyle(
                            //                 fontSize: 28,
                            //                 fontWeight: FontWeight.w700,
                            //                 color: Color(0xfffe50917)),
                            //           ),
                            //           const SizedBox(
                            //             height: 35,
                            //           ),
                            //           SizedBox(
                            //             height: 20,
                            //           ),
                            //
                            //           SizedBox(height: 50,),
                            //
                            //           Container(
                            //             width: 400,
                            //             height: 45,
                            //             child: ElevatedButton(
                            //               onPressed: () {
                            //
                            //               },
                            //               style: ElevatedButton.styleFrom(
                            //                   primary: const Color(0xfffe50917),
                            //                   shape: RoundedRectangleBorder(
                            //                       borderRadius: BorderRadius.circular(100)
                            //                   )),
                            //               child: Text(
                            //                 'Login'.toUpperCase(),
                            //                 style: const TextStyle(fontSize: 20),
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             height: 404.00,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // )
                            Container(
                              width: 250,
                              child:
                              const Image(
                                image: AssetImage('assets/movie_popcorn_2.png'),
                              ),
                            ),
                            SizedBox(height: 100),
                            Container(
                              width: 360,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'signup');
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xfffe50917),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Lineseed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 360,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xfffe50917),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50))),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontFamily: 'Lineseed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.upcomingRoute);
                              },
                              child: const Text('Skip',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Lineseed',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
