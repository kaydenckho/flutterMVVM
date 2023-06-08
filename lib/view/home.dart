import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'member/member.dart';
import 'news/news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentTab = [
    Member(),
    News(),
    Member(),
    News(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
            child: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.09,
              leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    // add border radius
                    child: Image.asset("assets/logo.png", fit: BoxFit.fitWidth),
                  )),
              elevation: 0,
              title: Transform(
                  transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                  child: const Text("Testing",
                      style: TextStyle(color: Colors.black))),
              backgroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.mail_outline_outlined),
                  color: Colors.black,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                ), //IconButton
                IconButton(
                  icon: const Icon(Icons.qr_code_scanner_outlined),
                  color: Colors.black,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  color: Colors.black,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                ), //IconB
              ],
            )),
        body: currentTab[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(
            color: Colors.red,
            size: 28,
            opacity: 1.0,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
            size: 24,
            opacity: 1.0,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Member',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_rounded),
              label: 'eCoupon',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'About',
            ),
          ],
          onTap: (index) {
            provider.currentIndex = index;
          },
        ));
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
