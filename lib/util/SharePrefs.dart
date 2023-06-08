
import 'package:shared_preferences/shared_preferences.dart';

const String keyCount = "key_count";

class SharedPrefs {

  SharedPrefs._internal();

   static SharedPreferences? _sharedPrefs;

   factory SharedPrefs() => SharedPrefs._internal();

   Future<void> init() async {
     _sharedPrefs ??= await SharedPreferences.getInstance();
   }

  int get count => _sharedPrefs?.getInt(keyCount) ?? 0;
  set count(int value) {
    _sharedPrefs?.setInt(keyCount, value);
  }

}



