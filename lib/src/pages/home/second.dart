import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 900,
            // color: Colors.amber,
            alignment: Alignment.center,
              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 370),
                FlutterLogo(
                  size: 120,
                ),
                SizedBox(height: 20,),

                Text('This is Heading',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54
                ),),
                SizedBox(height: 80,),
                Text('this is Paragraph-Lorem ipsum dolor sit amet, consectetur adip'
                    'iscing elit, sed do eiusmod tempor incididunt ut labore'
                    ' et dolore magna aliqua. Quis ipsum suspendisse ultrices'
                    ' gravida. Risus commodo viverra maecenas accumsan lacus vel '
                    'facilisis. ',
                style: TextStyle(
                  fontSize: 19
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }

}