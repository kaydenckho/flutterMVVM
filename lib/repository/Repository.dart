import 'dart:convert';
import '../model/Album.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<Album>?> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<Album>? albums = List<Album>.from(list.map((e) => Album.fromJson(e)));
      return albums;
    } else {
      return null;
    }
  }
}
