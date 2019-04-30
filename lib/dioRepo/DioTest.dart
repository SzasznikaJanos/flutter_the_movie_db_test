import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_the_movie_db_test/dioRepo/Token.dart';

class DioTest {
  BaseOptions baseOptions = BaseOptions(contentType: ContentType.json);
  Dio dio;

  DioTest() {
    dio = Dio(baseOptions);
  }

  void authTest() async {
    Response response = await dio.post("https://api.thetvdb.com/login", data: {
      "apikey": "U0NGODBYVORQE0DE",
      "username": "szasznikajanosolt",
      "userkey": "JAR6R9ZJ0SIMDEIV"
    });

    Token token = Token.fromJson(response.data);
    String tokenK = token.token;

    print("token = $tokenK");

    baseOptions.headers["authorization"] = "Bearer " + tokenK;

    print("headers  ${baseOptions.headers.toString()}");
    seriesTest();
  }

  void seriesTest() async {
    Response response = await dio.get("https://api.thetvdb.com/search/series",
        queryParameters: {"name": "friends"});

    print(response.data.toString());
  }
}
