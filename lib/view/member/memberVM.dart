import 'package:flutter/material.dart';

import '../../model/Album.dart';
import '../../repository/Repository.dart';

class MemberVM extends ChangeNotifier {
  List<Album>? album;

  Repository repository = Repository();

  bool _dispose = false;

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
      this.album = album;
      notifyListeners();
    }).catchError((e) {
      album = null;
      notifyListeners();
    });
  }
}
