import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/configs/app_settings.dart';
import 'package:algorithmx_dev/src/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  final List<String> imagePaths = [
    'assets/pic/9E179212-EF4D-4807-AAE4-A5904CE60ED7.JPG',
    'assets/pic/7473FB27-E2F0-4644-B798-5788CBBBB337.JPG',
    'assets/pic/39883EFA-ABCB-4A89-AD04-A9CE6D457D7C.JPG',
    'assets/pic/IMG_5204 2.JPG',
  ];
  int _current = 0;
  List<Map<String, String>> imgArray = [
    {
      "img":
          "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80",
      "title": "Login",
      "description":
          "You need a creative space ready for your art? We got that covered.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80",
      "title": "My Info",
      "description":
          "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80",
      "title": "Movie",
      "description":
          "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black54,
        drawer: CommonDrawer(),
        appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(
                fontSize: 23,
                fontFamily: 'Lineseed',
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.black,
          // backgroundColor: Color.fromRGBO(255, 0, 0, 0.1),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                          image: AssetImage('assets/banner.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Services',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'LineSeed',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  // color: Colors.white
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                //First row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.upcomingRoute);
                    },
                    child: Column(
                      children: [
                        Container(
                          // child: Column(mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     SizedBox(height: 10,),
                          //     // Text('Movie')
                          //
                          //   ],
                          // ),
                          width: 90,
                          height: 90,
                          decoration: ShapeDecoration(
                            shadows: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.4), // Shadow color
                                spreadRadius: 0, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(
                                    0, 4), // Offset in the X, Y direction
                              ),
                            ],
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/watching-a-movie.png'),
                                scale: 9),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text('Movie',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lineseed',
                                  fontSize: 16,
                                  color: Colors.black87))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.newsRoute);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: ShapeDecoration(
                            shadows: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.4), // Shadow color
                                spreadRadius: 0, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(
                                    0, 4), // Offset in the X, Y direction
                              ),
                            ],
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/live.png'),
                                scale: 10),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text('Popular',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lineseed',
                                  fontSize: 16,
                                  color: Colors.black87))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.topRatedRoute);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.4), // Shadow color
                                  spreadRadius: 0, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: Offset(
                                      0, 4), // Offset in the X, Y direction
                                ),
                              ],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/rating.png'),
                                  scale: 10),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Top Rated',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lineseed',
                                  fontSize: 16,
                                  color: Colors.black87))
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.upcomingRoute);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.4), // Shadow color
                                  spreadRadius: 0, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: Offset(
                                      0, 4), // Offset in the X, Y direction
                                ),
                              ],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/qr-code.png'),
                                  scale: 10),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('QR generator',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lineseed',
                                  fontSize: 16,
                                  color: Colors.black87))
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.scanRoute);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.4), // Shadow color
                                  spreadRadius: 0, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: Offset(
                                      0, 4), // Offset in the X, Y direction
                                ),
                              ],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/qr-code-scan2.png'),
                                  scale: 11),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Scan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lineseed',
                                  fontSize: 16,
                                  color: Colors.black87))
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.gamesRoute);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.4), // Shadow color
                                  spreadRadius: 0, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: Offset(
                                      0, 4), // Offset in the X, Y direction
                                ),
                              ],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/console.png'),
                                  scale: 10),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Games',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lineseed',
                                  fontSize: 16,
                                  color: Colors.black87),)
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/my_icon.png'),
                    ),
                    trailing: Icon(
                      Icons.expand_more,
                    ),
                    tileColor: Color(0xffff0f0f0),
                    title: Text('Sulfifi Ming'),
                    subtitle: Text('BOSS'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: Column(
                    children: [
                      Image.asset(
                          'assets/pic/7473FB27-E2F0-4644-B798-5788CBBBB337.JPG'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dictum porttitor leo a pharetra. Praesent '
                          'elementum luctus enim quis lobortis. Praesent vel tempor tortor. Maecenas accumsan felis et volutpat elementum.'
                          ' Morbi sagittis lacus vitae egestas fermentum.'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    child: Center(
                        child: Image.network(images[index],
                            fit: BoxFit.cover, width: 1000)),
                  );
                },
              ),
              CarouselSlider(
                items: imgArray
                    .map((item) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, item["page"].toString());
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.4),
                                          blurRadius: 8,
                                          spreadRadius: 0.3,
                                          offset: Offset(0, 3))
                                    ]),
                                    child: AspectRatio(
                                      aspectRatio: 2 / 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.network(
                                          item["img"].toString(),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Column(
                                    children: [
                                      Text(item["price"].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.pinkAccent)),
                                      Text(item["title"].toString(),
                                          style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.black)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 8),
                                        child: Text(
                                          item["description"].toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blueGrey),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 530,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 4 / 4,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    // viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Theme(
        data: ThemeData(canvasColor: Colors.black, primaryColor: Colors.black),
        child: Column(
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
                Navigator.pushNamed(context, 'info');
              },
              leading: Icon(
                Icons.info,
                color: Colors.black87,
              ),
              title: Text('Info'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'upcoming');
              },
              leading: Icon(
                Icons.movie,
                color: Colors.black87,
              ),
              title: Text('Movie'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'login');
              },
              leading: Icon(
                Icons.login_outlined,
                color: Colors.black87,
              ),
              title: Text('Login'),
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black54),
              title: Text('Log out'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSettings.passwordSetting);
                prefs.remove(AppSettings.userNameSetting);
                Navigator.pushNamed(context, AppRoute.welcomeRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
