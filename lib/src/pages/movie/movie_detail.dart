import 'package:algorithmx_dev/src/configs/app_route.dart';
//import 'package:algorithmx_dev/src/pages/app.dart';
import 'package:algorithmx_dev/src/pages/model/upcoming_movie_model.dart';
import 'package:flutter/material.dart';
class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  
  Result? _movieModel;

  @override
  void initState() {
    _movieModel = Result();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Result) {
      _movieModel = arguments;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.videoRoute,
              arguments: _movieModel?.id);
        },
        child: Text('VDO'),
      ),
      appBar: AppBar(
        title: Text((_movieModel?.title ?? '')),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("\n"),
            Container(
              width: 470,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      (_movieModel?.posterPath ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('\npopularity : ' + (_movieModel?.popularity.toString() ?? '')),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 370,
                child: Card(
                  color: Colors.blueGrey.shade50,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'OVERVIEW',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _movieModel?.overview ?? '',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(Icons.volume_down,
                                    color: Colors.orangeAccent),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.volume_off,
                                    color: Colors.orangeAccent),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.favorite_border,
                                    color: Colors.red),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.share, color: Colors.green),
                                onPressed: () {}),
                            TextButton(onPressed: () {}, child: Text('ACTION')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}