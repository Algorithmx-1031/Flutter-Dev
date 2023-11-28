import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/pages/model/upcoming_movie_model.dart';
import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:flutter/material.dart';

class UpcomingMoviePage extends StatefulWidget {
  const UpcomingMoviePage({super.key});

  @override
  State<UpcomingMoviePage> createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  Future<UpcomingMovieModel>? _upcomingMovieModel;

  @override
  void initState() {
    _upcomingMovieModel = NetworkService().getUpComingMovieDio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          onPressed: (){
            Navigator.pushNamed(context, 'home');
          },
        ),
        title: const Text(
          'Upcoming Movie',
          style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontFamily: 'LineSeed',
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
          child: FutureBuilder(
        future: _upcomingMovieModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data?.results?[index];
                  return ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoute.movieRoute, arguments: movie);
                    },
                    title: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:  Image.network(
                                'https://image.tmdb.org/t/p/w500' + (movie?.posterPath ?? ''),
                          )

                          ),
                        ),
                        Flexible(child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 70),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movie?.title??'',
                                    style: const TextStyle(
                                      fontFamily: 'Lineseed',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800
                                    )
                                    ,),
                                  Text(movie?.releaseDate?.year.toString()??'',
                                  style: const TextStyle(
                                    fontFamily: 'Lineseed',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54
                                  ),),
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
      )),
    );
  }
}
