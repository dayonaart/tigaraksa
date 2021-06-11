import 'package:and/api/url.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  _checkNetwork() async {
    return await (Connectivity().checkConnectivity());
  }

  final BaseOptions options = new BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 30000,
      responseType: ResponseType.json,
      receiveTimeout: 30000,
      headers: {
        "Content-Type": "application/json",
      });
  Future<dynamic> postData({
    @required String endpoint,
    @required dynamic payload,
    String customUrlApi,
  }) async {
    var _net = await _checkNetwork();
    try {
      var _res = await Dio(options).post("$endpoint", data: payload);
      if (_res.statusCode == 200) {
        return _res.data;
      } else {
        return _res.data;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw "Connection was timeout";
      } else if (e.type == DioErrorType.RESPONSE) {
        if (e.response.data['status'] == 400) {
        } else if (e.response.data['status'] == 404) {
          throw "${e.response.data.toString()}";
        } else if (e.response.statusCode == 500) {
          throw "error ${e.response.data}";
        } else {
          throw "${e.response.data['message']}";
        }
      } else if (_net == ConnectivityResult.none) {
        throw "Please check your internet connection";
      }
    }
  }
}
