import 'package:flutter/material.dart';
import 'package:my_app/util/SharePrefs.dart';
import 'package:my_app/view/home.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp( MaterialApp(
        home: ChangeNotifierProvider<BottomNavigationBarProvider>(
            child: const Home(),
            create: (_) => BottomNavigationBarProvider(),
      )
  ));
}


