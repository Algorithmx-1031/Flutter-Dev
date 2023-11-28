import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../model/video_model.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  String? _id;
  Result? _movieModel;
  Future<VideoModel>? _vdoModel;

  @override
  void initState() {
    _movieModel = Result();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? arguments = ModalRoute.of(context)?.settings.arguments;
    _id = arguments.toString();
    _vdoModel = NetworkService().getVideoDio(_id.toString());
    if (arguments is Result) {
      _movieModel = arguments;
    }

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text((_movieModel?.name ?? '')),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: _vdoModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (context, index) {
                  var vdo = snapshot.data?.results?[index];
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: vdo?.key ?? '',
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: true,
                    ),
                  );
                  return Card(
                    child: Column(
                      children: [
                        Text(vdo?.name ?? ''),
                        YoutubePlayer(
                          controller: _controller,
                          liveUIColor: Colors.amber,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}