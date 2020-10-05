
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  String url = 'http://ruvem.ru/';

  final response = await http.get(url+'/wp-json/wp/v2/posts?_embed&per_page=100',headers:{"Accept":"application/json"});
  var convertDataToJson =  jsonDecode(response.body);
  return convertDataToJson;
}

