import 'dart:convert';

import 'package:puppies/models/puppies.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<dynamic> puppies;

  ApiService({required this.puppies});

  factory ApiService.fromJson(List<dynamic> json) => ApiService(puppies: json);

  Future<List<Puppies>> fetchPost() async {
    List<Puppies> list = [];
    // final limit = 10;
    final url = Uri.parse(
        "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=live_SzyBfBZB3zG66nKf7sMeEtmgKsQN07O4V8h7g3zEFSTzA9tMDksnAUhzyVSm9gUV");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (var element in json.decode(response.body)) {
        list.add(Puppies.fromJson(element));
      }
      return list;
    } else {
      throw Exception("Impossible de charger les données");
    }
  }

  Future<Puppies> getOne(String id) async {
    // final limit = 10;
    final url = Uri.parse("https://api.thecatapi.com/v1/images/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(json.decode(response.body)[0]);
      // print("*********************");

      return Puppies.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Impossible de charger les données");
    }
  }
}
