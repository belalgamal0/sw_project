import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'CustomExceptions.dart';
class ApiProvider {
  final String _baseUrl = "blogz-api.herokuapp.com";

  Future<dynamic> get(String path) async {
    var responseJson;
    try {
      final response = await http.get(Uri.https(_baseUrl, path));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String path, Map<String, dynamic> parameters) async {
    var responseJson;
    var body = json.encode(parameters);
    try {
      final response =
          await http.post(Uri.https(_baseUrl, path), body: body , headers: {"Content-Type": "application/json"});
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }}