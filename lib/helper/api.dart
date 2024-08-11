import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      // Map<String, String> data = jsonDecode(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}\n and body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> post(
      {required String url, @required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      var encode = jsonEncode(response.body);
      Map<String, dynamic> data = jsonDecode(encode);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}\n and body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url, @required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    log('URL: $url \n BODY: $body \n TOKEN: $token');
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      var encode = jsonEncode(response.body);
      Map<String, dynamic> data = jsonDecode(encode);
      log(data.toString());
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}\n and body $jsonDecode(encode)}');
    }
  }
}
