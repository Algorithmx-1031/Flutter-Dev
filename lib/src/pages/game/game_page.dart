
import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:flutter/material.dart';

import '../../configs/api.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Games - 009 Sulfifi M.',
          style: TextStyle(
              fontFamily: 'Lineseed',
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        // color: Colors.black,
        child: FutureBuilder(
          future: NetworkService().getAllGameDio(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data?.games?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    // mainAxisExtent: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    var game = snapshot.data?.games?[index];
                    print(game?.gameId.toString());
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
                              API.GAME_IMAGE + (game?.gameImg ?? ''),
                            ),
                            Text(game?.gameId ??
                                '' + ' ' + (game?.gameName ?? '')),
                            Text('Price : ' +
                                (game?.gamePrice.toString() ?? '')),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: IconButton(onPressed: (){
                                    Navigator.pushNamed(context, AppRoute.gameManagementRoute);
                                  },
                                  icon: Icon(Icons.edit)),
                                  
                                ),
                                Flexible(
                                  flex: 1,
                                  child: IconButton(onPressed: (){
                                    _showMyDialog(game?.id.toString() ?? '');
                                  },
                                  icon: Icon(Icons.delete),),
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
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, AppRoute.gameManagementRoute);
          }, child: Icon(Icons.add)),
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
