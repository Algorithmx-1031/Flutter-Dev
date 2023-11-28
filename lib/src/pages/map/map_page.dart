
// ignore_for_file: unused_import

import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/pages/app.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool iconClicked0 = false;
  bool iconClicked1 = false;
  bool iconClicked2 = false;
  bool iconClicked3 = false;
  bool iconClicked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map',
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lineseed'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Row(
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoute.gamesRoute);
                      setState(() {
                        iconClicked0 = !iconClicked0;
                      
                      });
                    },
                    child: Opacity(
                            opacity: iconClicked0 ? 0.2 : 1.0,
                            child: Icon(
                              Icons.table_restaurant_rounded,
                              size: 80.0,
                            ),
                          ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoute.gamesRoute);
                      setState(() {
                        iconClicked1 = !iconClicked1;
                        
                    
                      });
                    },
                    child: Opacity(
                            opacity: iconClicked1 ? 0.2 : 1.0,
                            child: Icon(
                              Icons.table_restaurant_rounded,
                              size: 80.0,
                            ),
                          ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoute.gamesRoute);
                      setState(() {
                        iconClicked2 = !iconClicked2;
                        
                    
                      });
                    },
                    child: Opacity(
                            opacity: iconClicked2 ? 0.2 : 1.0,
                            child: Icon(
                              Icons.table_restaurant_rounded,
                              size: 80.0,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
