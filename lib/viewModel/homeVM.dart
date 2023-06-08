import 'package:flutter/material.dart';
import '../model/Album.dart';
import '../repository/Repository.dart';

class HomeVM extends ValueNotifier<List<Album>?> {

  Repository repository = Repository();

  bool _dispose = false;

  HomeVM(super.value);

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  void getData() {
    repository.fetchAlbum().then((album) {
      value = album;
 }).catchError((e) {
      value = null;
      notifyListeners();
    });
  }
}