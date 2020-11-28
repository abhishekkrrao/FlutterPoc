import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Album.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dharmlokmodel.dart';
class Services {
  static Future<List<Album>> getPhotos() async {
    try {
      final response =
      await http.get("https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == 200) {
        List<Album> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<List<Model>> getJson() async {
    try {
      final response = await rootBundle.loadString('assets/dharmlok.json');
      List<Model> list = parseData(response);
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Model> parseData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Model>((json) => Model.fromJson(json)).toList();
  }

  // Parse the JSON response and return list of Album Objects //
  static List<Album> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
