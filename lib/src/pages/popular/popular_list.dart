import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/pages/model/news_model.dart';
import 'package:algorithmx_dev/src/pages/model/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:algorithmx_dev/src/pages/services/network.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
  @override
  void initState() {
    _popularModel = NetworkService().getPopuparDio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black45,
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          'Watch Now',
          style: TextStyle(fontFamily: 'Lineseed', fontWeight: FontWeight.w600,
            fontSize: 35,),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: FutureBuilder(
          future: _popularModel,
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
    );
  }
}
