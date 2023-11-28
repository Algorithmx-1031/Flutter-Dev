import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/my_icon.png'),
                // backgroundColor: Colors.black,
              ),
              accountName: Text('Algorithmx'),
              accountEmail: Text('algorithmx.lab@gmail.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'home');
              },
              leading: Icon(
                Icons.home_rounded,
                color: Colors.black87,
              ),
              title: Text('Home'),
            ),

            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.upcomingRoute);
              },
              leading: Icon(
                Icons.movie,
                color: Colors.black87,
              ),
              title: Text('Movie'),
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black54),
              title: Text('Log out'),
            ),
          ],
        ),
      ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
            onPressed: (){
              Navigator.pushNamed(context, 'home');
            },
          ),
          title: Text('My Information',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'LineSeed',
            fontWeight: FontWeight.w600

          ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // height: 500,
                  color: Colors.grey.shade50,
                  // padding: const EdgeInsets.fromLTRB(30.0, 40, 20.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 150,

                        // color: Colors.amber.shade100,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage('assets/green_leaf.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50.0, 60, 20.0, 0.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/my_icon.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(50.0, 0, 20.0, 0.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height:
                          200), // Add spacing between the image and other content
                      Text(
                        'Algorithmx',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LineSeed'
                          // fontFamily: ,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(20, 230, 20.0, 0.0),
                  
                  // width: 300,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20), // Add spacing between the name and role
                      Text(
                        'Graphic designer and Front end developer.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      width: 800,
                      child: Divider(
                        color: Colors.black54,
                        thickness: 1.01,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.account_circle_outlined,
                            color: Colors.amber,
                            size: 35,),
                          SizedBox(width: 15,),
                          Text('Nike name : BOSS',
                            style: TextStyle(
                                fontSize: 20
                            ),),
                        ],

                      ),
                      SizedBox(height: 20,
                      /*
                      child: Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                       */
                      ),

                      Row(
                        children: [

                          Icon(Icons.phone_android_outlined,
                          color: Colors.amber,
                          size: 35,),
                          SizedBox(width: 15,),
                          Text('095 438 8250',
                            style: TextStyle(
                              fontSize: 20
                            ),)
                        ],
                      ),
                      SizedBox(height: 20,
                      /*
                        child: Divider(
                        color: Colors.black54,
                      ),
                       */
                      ),

                      Row(
                        children: [
                          Icon(Icons.email_outlined,
                          color: Colors.amber,
                          size: 35,),
                          SizedBox(width: 15,),
                          Text('algorithmx.lab@gmail.com',
                          style:
                            TextStyle(
                              fontSize: 20,

                            ),)

                        ],
                      ),
                    ],
                  ),

                ),



                // Container(
                //   // alignment: Alignment.topCenter,
                //   padding: const EdgeInsets.fromLTRB(30, 40, 20.0, 0.0),
                //   color: Colors.red,
                // ),
              ]),
        ),

      );

  }

}