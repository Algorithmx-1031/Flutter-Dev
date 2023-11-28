import 'dart:convert';
// ignore: unused_import
import 'dart:io';

import 'package:dio/dio.dart';
import '../../configs/api.dart';
import '../model/game_model.dart';
import '../model/news_model.dart';
import '../model/popular_model.dart';
import '../model/top_rated_model.dart';
import '../model/upcoming_movie_model.dart';
import '../model/video_model.dart';
import 'package:http_parser/http_parser.dart';

class NetworkService {
  static final Dio _dio = Dio();

  void getHttp() async {

    final _dio = Dio();
    final response = await _dio.get(API.MOVIE_URL);
    print(response);
  }
  
  Future<UpcomingMovieModel> getUpComingMovieDio() async {
    final response = await _dio.get(API.MOVIE_URL);
    if (response.statusCode == 200){
      print(response.data);
      return upcomingMovieModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<VideoModel> getVideoDio(String id) async {
    String key = "/videos?api_key=b4e1da8db33117e80ca69a5af4b7bc3e";

    final response = await _dio.get(API.VDO_URL + id + key);
    if (response.statusCode == 200){
      print(response.data);
      return videoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<NewsModel> getTrendingDio() async {
  
    String key = "?api_key=b4e1da8db33117e80ca69a5af4b7bc3e";

    final response = await _dio.get(API.TRENDING_URL + key);
    if (response.statusCode == 200){
      print(response.data);
      return newsModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

    Future<GameModel> getAllGameDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.GAME;
    //print('url getAllGameDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return gameModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }
  
  Future<String> validateUserLoginDio(String username, String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    try {
      //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
      //var url = API.BASE_URL + '/api/user';
      var url = API.BASE_URL + '/flutterapi/api/user';
      //var url = 'http://10.73.4.192/flutterapi/api/user';

      print(url);
      final response = await _dio.post(url, data: data);
      if (response.statusCode == 200) {
        var jsonString = response.data;
        var jsonMap = json.encode(jsonString);
        String username = jsonString["username"];
        print('>>username = ' + username);
        String password = jsonString["password"];
        print('>>password = ' + password);
        if (username != 'failed') {
          return 'pass';
        } else {
          return 'failed';
        }
      } else {
        return 'failed';
      }
    } catch (Exception) {
      return "failed";
    }
  }

  Future<String> deleteGameDio(String id) async {
    print(API.BASE_URL + API.GAME + '/' + id);
    final response = await _dio.delete(API.BASE_URL + API.GAME + '/' + id);

    if (response.statusCode == 200) {
      if (response.data > 0) {
        return 'Delete Successfully';
      } else {
        return 'Delete Failed';
      }
    }
    throw Exception('Network failed');
  } //end

  Future<String> addGameDio(File imageFile, Game game) async {
    FormData data = FormData.fromMap({
      'game_id': game.gameId,
      'game_name': game.gameName,
      'game_price': int.parse(game.gamePrice.toString()),
      'game_detail': game.gameDetail,
      'game_stock': int.parse(game.gameStock.toString()),
      if (imageFile != null)
        'game_img': 'has_image'
      else
        'game_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.GAME, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
    }
    throw Exception('Network failed');
  }

  Future<String> addGameDioNoImage(Game game) async {
    FormData data = FormData.fromMap({
      'game_id': game.gameId,
      'game_name': game.gameName,
      'game_price': int.parse(game.gamePrice.toString()),
      'game_detail': game.gameDetail,
      'game_stock': int.parse(game.gameStock.toString()),
      'game_img': 'no_image',
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.GAME, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
    }
    throw Exception('Network failed');
  }

  Future<String> editGameDio(File imageFile, Game game) async {
    FormData data = FormData.fromMap({
      'game_name': game.gameName,
      'game_price': game.gamePrice,
      'game_detail': game.gameDetail,
      'game_img': game.gameImg,
      'game_stock': game.gameStock,
      if (imageFile != null)
        'game_img': game.gameImg
      else
        'game_img': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
    await _dio.post(API.BASE_URL + API.GAME + '/' + game.id.toString(), data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }
  Future<PopularModel> getPopuparDio() async {
    // String key = "?api_key=b4e1da8db33117e80ca69a5af4b7bc3e";
    final response = await _dio.get(API.POPULAR_URL);
    if (response.statusCode == 200) {
      print(response.data);
      return popularModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }
  Future<TopRatedModel> getTopRatedDio() async {

    String key = "?api_key=b4e1da8db33117e80ca69a5af4b7bc3e&language=en-US&page=1";

    final response = await _dio.get(API.T_RATED_URL + key);
    if (response.statusCode == 200){
      print(response.data);
      return topRatedModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }
  Future<String> editGameDioNoImage(Game game) async {
    FormData data = FormData.fromMap({
      'game_name': game.gameName,
      'game_price': game.gamePrice,
      'game_detail': game.gameDetail,
      'game_img': 'no_image',
      'game_stock': game.gameStock,
    });

    final response =
    await _dio.post(API.BASE_URL + API.GAME + '/' + game.id.toString(), data: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      if (response.data > 0) {
        return 'Edit Successfully';
      } else {
        return 'Edit Failed';
      }
    }
    throw Exception('Network failed');
  }
}//end class

