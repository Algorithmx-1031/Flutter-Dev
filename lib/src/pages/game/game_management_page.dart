import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:algorithmx_dev/src/pages/model/game_model.dart';
import 'package:flutter/material.dart';

import '../../configs/api.dart';
import '../../configs/app_route.dart';
import '../services/network.dart';

class GameManagementPage extends StatefulWidget {
  const GameManagementPage({super.key});

  @override
  State<StatefulWidget> createState() => _GameManagementState();
}

class _GameManagementState extends State<GameManagementPage> {
  final _formKey = GlobalKey<FormState>();

  bool? _editMode;
  Game? _game;

  File? _image;
  final picker = ImagePicker();

  callBack(File image) {
    _image = image;
  }

  @override
  void initState() {
    _editMode = false;
    _game = Game();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_label
    theme:
    ThemeData(primaryColor: Colors.black);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildIdInput(),
                      flex: 1,
                    ),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: _buildNameInput(),
                      flex: 2,
                    )
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                _buildDetailInput(),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildPriceInput(),
                      flex: 1,
                    ),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: _buildStockInput(),
                      flex: 1,
                    )
                  ],
                ),
                SizedBox(height: 12.0),
                _buildImageInput(),
                ProductImage(callBack, image: _game?.gameImg ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputStyle({String? label}) => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(fontSize: 20.0),
      );

  TextFormField _buildNameInput() => TextFormField(
        decoration: inputStyle(label: "Name"),
        onSaved: (String? value) {
          print(value);
          _game?.gameName = value;
        },
      );

  TextFormField _buildPriceInput() => TextFormField(
        decoration: inputStyle(label: "Price"),
        keyboardType: TextInputType.number,
        onSaved: (String? value) {
          print(value);
          _game?.gamePrice = value;
        },
      );

  TextFormField _buildStockInput() => TextFormField(
        decoration: inputStyle(label: "Stock"),
        keyboardType: TextInputType.number,
        onSaved: (String? value) {
          print(value);
          _game?.gameStock = value;
        },
      );
  TextFormField _buildIdInput() => TextFormField(
        decoration: inputStyle(label: "Id"),
        keyboardType: TextInputType.number,
        onSaved: (String? value) {
          print(value);
          _game?.gameId = value;
        },
      );

  TextFormField _buildDetailInput() => TextFormField(
        decoration: inputStyle(label: "Detail"),
        keyboardType: TextInputType.text,
        onSaved: (String? value) {
          print(value);
          _game?.gameDetail = value;
        },
      );
  TextFormField _buildImageInput() => TextFormField(
        decoration: inputStyle(label: "Image"),
        keyboardType: TextInputType.name,
        onSaved: (String? value) {
          print(value);
        },
      );
  AppBar _buildAppBar() => AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: Text((_editMode ?? false) ? 'Edit Game' : 'Add Game'),
        actions: [
          TextButton(
            onPressed: () async {
              _formKey.currentState?.save();
              FocusScope.of(context).requestFocus(FocusNode());
              if ((_editMode ?? false)) {
                //todo
              } else {
                                try {
                  Navigator.pop(context);
                  final message;
                  if (_image != null) {
                    message = await NetworkService().addGameDio(_image!, _game!);
                  } else {
                    message = await NetworkService().addGameDioNoImage(_game!);
                  }
                  print('message = $message');
                  if (message == 'Add Successfully') {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.gamesRoute, (route) => false);
                  } else {
                    // Flushbar(
                    //   icon: Icon(
                    //     Icons.cancel,
                    //     color: Colors.greenAccent,
                    //   ),
                    //   backgroundGradient:
                    //       LinearGradient(colors: [Colors.red, Colors.grey]),
                    //   title: "Add",
                    //   message: "Add Failed",
                    //   duration: Duration(seconds: 5),
                    // )..show(context);
                  }
                // ignore: unused_catch_clause
                } on Exception catch (e) {
                  // Flushbar(
                  //   icon: Icon(
                  //     Icons.cancel,
                  //     color: Colors.greenAccent,
                  //   ),
                  //   backgroundGradient:
                  //       LinearGradient(colors: [Colors.red, Colors.grey]),
                  //   title: "Add",
                  //   message: "Add Failed",
                  //   duration: Duration(seconds: 5),
                  // )..show(context);
                }
              }
            },
            child: Text(
              'submit',
              style: TextStyle(color: Colors.white70),
            ),
          )
        ],
      );
} //end

class ProductImage extends StatefulWidget {
  final Function callBack;
  final String image;

  const ProductImage(this.callBack, {Key? key, required this.image})
      : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File? _imageFile;
  String? _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    _image = widget.image;
    super.initState();
  }

  @override
  void dispose() {
    _imageFile?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPickerImage(),
          _buildPreviewImage(),
        ],
      ),
    );
  }

  dynamic _buildPreviewImage() {
    if ((_image == null || _image!.isEmpty) && (_imageFile == null)) {
      return SizedBox();
    }

    final container = (Widget child) => Container(
          color: Colors.grey[100],
          margin: EdgeInsets.only(top: 4),
          alignment: Alignment.center,
          height: 350,
          child: child,
        );

    return _image != null
        ? container(Image.network('${API.GAME_IMAGE}/$_image'))
        : Stack(
            children: [
              container(Image.file(_imageFile!)),
              _buildDeleteImageButton(),
            ],
          );
  }

  OutlinedButton _buildPickerImage() => OutlinedButton.icon(
        icon: Icon(Icons.image),
        label: Text('image'),
        onPressed: () {
          _modalPickerImage();
        },
      );

  void _modalPickerImage() {
    final buildListTile =
        (IconData icon, String title, ImageSource source) => ListTile(
              leading: Icon(icon),
              title: Text(title),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(source);
              },
            );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListTile(
                Icons.photo_camera,
                "Take a picture from camera",
                ImageSource.camera,
              ),
              buildListTile(
                Icons.photo_library,
                "Choose from photo library",
                ImageSource.gallery,
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImage(ImageSource source) {
    _picker
        .pickImage(
      source: source,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((file) {
      if (file != null) {
        setState(() {
          _imageFile = File(file.path);
          _image = null;
          widget.callBack(_imageFile);
        });
      }
    }).catchError((error) {
      //todo
    });
  }

  Positioned _buildDeleteImageButton() => Positioned(
        right: 0,
        child: IconButton(
          onPressed: () {
            print('click delete image');
            setState(() {
              _imageFile = null;
              //widget.callBack(null);
            });
          },
          icon: Icon(
            Icons.clear,
            color: Colors.black54,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      );
}
