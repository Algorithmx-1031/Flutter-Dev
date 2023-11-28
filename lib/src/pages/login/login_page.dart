import 'package:algorithmx_dev/src/configs/app_route.dart';
import 'package:algorithmx_dev/src/configs/app_settings.dart';
import 'package:algorithmx_dev/src/pages/services/network.dart';
import 'package:flutter/material.dart';
import 'package:algorithmx_dev/src/configs/api.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isHidden = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*appBar:
      AppBar(
        title:
        Text('Login',
          style: TextStyle(
            color: Color(0xfffffb300)
          ),),
        backgroundColor: Color(0xffffafafa),
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Container(
                height: 1015,
                alignment: Alignment.center,
                // color: const Color(0xfffca9c42),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/welcome.jpg'),
                          fit: BoxFit.cover,
                          opacity: 0.7,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios_rounded),
                                color: Colors.white,
                                iconSize: 28,
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoute.welcomeRoute);
                                },
                              ),
                              // Icon(
                              //   Icons.arrow_back_ios,
                              //   color: Colors.white,
                              // ),
                              SizedBox(
                                width: 110,
                              ),
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                    fontSize: 29,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                'ไทย/Eng',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50)
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xfffe50917)),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  TextField(
                                    controller: _usernameController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      labelText: 'Username or Email',
                                      icon: Icon(Icons.account_circle_outlined),
                                      hintText: 'example.@email.com',
                                    ),
                                    style: const TextStyle(
                                        fontFamily: 'LineSeed',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: isHidden,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      icon: const Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        onPressed: togglePasswordVisibility,
                                        icon: isHidden
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontFamily: 'LineSeed',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.fromLTRB(40.0, 0, .0, 0.0),
                                    child: const Text('Forgot Password ?',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Lineseed',
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,

                                    ),),
                                    ),
                                  SizedBox(height: 50,),

                                  Container(
                                    width: 400,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        print('click');
                                        NetworkService().getHttp();

                                        final username = _usernameController.text;
                                        final password = _passwordController.text;
                                        if (username == 'A' && password == '1') {
                                          print('Login success');
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString(AppSettings.userNameSetting, username);
                                          prefs.setString(AppSettings.passwordSetting, password);
                                          Navigator.pushNamed(context, 'home');
                                        } else {
                                          print('Login failed');
                                        }
                                        print('login with $username $password');
                                        Flushbar(
                                          title: "Error",
                                          message:
                                              "Your username or password is wrong!",
                                          duration: const Duration(seconds: 5),
                                          icon: const Icon(
                                            Icons.error,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                          backgroundColor: Colors.black,
                                        ).show(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: const Color(0xfffe50917),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100)
                                      )),
                                      child: Text(
                                        'Login'.toUpperCase(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 404.00,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
