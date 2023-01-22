import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:igniters/constants/url_conatants.dart';
import 'package:igniters/utils/services/app_exceptions.dart';

class RestAPIService {
  final String baseURL = APIUrl.baseUrl;
  Future<dynamic> get(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseURL+ url),
          headers: {"Content-Type": "application/json"});
      responseJson = await _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future<dynamic> post(String url, body) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseURL+ url),
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));
      responseJson = await _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }
    return responseJson;
  }

  Future<dynamic> register(String url, body, String? token) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseURL + url),
          headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token"
            "Authorization": "Bearer $token"
          },
          body: json.encode(body));
      responseJson = await _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Exception");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        // throw BadRequestException(response.body.toString());
        //by prakhyat
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}
