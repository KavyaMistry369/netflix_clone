import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/all_model.dart';
import 'package:netflix_clone/models/search_model.dart';

class APIService {
  APIService._();

  static final APIService apiService = APIService._();

  List<SearchModel> allSearchData = [];

  Future<void> getData({required String title}) async {
    http.Response response = await http.get(
        Uri.parse("https://movies-api14.p.rapidapi.com/search?query=$title"),
        headers: {
          'X-RapidAPI-Key':
              '9c785e8b6bmsh8b02e98bd6bdd24p16ae63jsncd06f47b7bb8',
          'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> allData = jsonDecode(response.body);
      List data = allData["contents"];
      allSearchData = data.map((e) => SearchModel.fromMap(data: e)).toList();
      print(allSearchData);
    }
  }
}
