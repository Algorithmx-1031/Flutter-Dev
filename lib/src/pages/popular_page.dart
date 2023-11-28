import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:flutter/material.dart';

import '../configs/api.dart';
import '../configs/app_route.dart';
import 'home/welcome_page.dart';
import 'model/popular_model.dart';
class PopularPage extends StatefulWidget {
  const PopularPage({super.key});
  @override
  State<StatefulWidget> createState() => _PopularPageState();
}
class _PopularPageState extends State<StatefulWidget> {
  Future<PopularModel>? _popularModel;

  int _currentIndex = 0;
  final List<BottomNavigationBarItem> navigationItems = [

    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Account',
    ),
  ];
  final List<Widget> screens = [
    WelcomePage(),
    PopularPage(),
  ];
  @override
  void initState() {
    _popularModel = NetworkService().getPopuparDio();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170,
        title: const Text(
          'Watch Now',
          style: TextStyle(
              fontSize: 50,
              fontFamily: 'Lineseed',
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        // color: Colors.black,
        child: FutureBuilder(
          future: _popularModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data?.results?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    // mainAxisExtent: 300,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    var popular = snapshot.data?.results?[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                            // color: Colors.black,
                            child: ListTile(
                          title: Column(children: [
                            Image.network(
                              height: 180,
                              API.POPULAR_URL + (popular?.posterPath ?? ''),
                            ),
                            Text(popular?.id.toString() ??
                                "" + '' + (popular?.title.toString() ?? "")),
                            Text('Price : ' + (popular?.overview ?? "")),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, AppRoute.popularRoute);
                                      },
                                      icon: Icon(Icons.edit)),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      _showMyDialog(
                                          popular?.id.toString() ?? "");
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                )
                              ],
                            )
                          ]),
                        )),
                      ],
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 16,
        unselectedFontSize: 13,

        unselectedItemColor: Colors.grey, // Color for unselected items
        selectedItemColor: Color(0xfffe50917),   // Color for the selected item
        currentIndex: _currentIndex,
        items: navigationItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, AppRoute.popularRoute);
      //     },
      //     child: Icon(Icons.add)),
    );
  }

  Future<void> _showMyDialog(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class StartPage {
}