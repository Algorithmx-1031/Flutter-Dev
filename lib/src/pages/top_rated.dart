import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:flutter/material.dart';

import '../configs/api.dart';
import '../configs/app_route.dart';
import 'model/top_rated_model.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});
  @override
  State<StatefulWidget> createState() => _TopRatedPageState();
}
class _TopRatedPageState extends State<StatefulWidget> {
  Future<TopRatedModel>? _topRatedModel;

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

  @override
  void initState() {
    _topRatedModel = NetworkService().getTopRatedDio();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: const Text(
          'Watch Now - top rated',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Lineseed',
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: Color(0xfff111111),
      ),
      body: Container(
        child: FutureBuilder(
          future: _topRatedModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.results?.length,
                  itemBuilder: (context, index) {
                    var popular = snapshot.data?.results?[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.movieRoute,
                            arguments: popular);
                      },
                      title: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500' +
                                      (popular?.posterPath ?? ''),
                                )),
                          ),
                          Flexible(
                              child: Stack(
                                children: [
                                  Container(
                                    padding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 70),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          popular?.title ?? '',
                                          style: const TextStyle(
                                              fontFamily: 'Lineseed',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          popular?.releaseDate?.year.toString() ??
                                              '',
                                          style: const TextStyle(
                                              fontFamily: 'Lineseed',
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 16,
        unselectedFontSize: 13,

        unselectedItemColor: Colors.grey, // Color for unselected items
        selectedItemColor: Color(0xfffe50917), // Color for the selected item
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