import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/Album.dart';
import '../viewModel/homeVM.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HomeVM vm = HomeVM(null);

  var currentTab = [
    Member(),
    Profile(),
    Setting(),
    Profile()
  ];

  @override
  void initState() {
    super.initState();
    vm.getData();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
      child: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // add border radius
              child: Image.asset(
                  "assets/logo.png",
                  fit:BoxFit.fitWidth
              ),
            )),
        elevation: 0,
        title: Transform(transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
            child: const Text("Testing",style: TextStyle( color: Colors.black))),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.mail_outline_outlined),
            color: Colors.black,
            highlightColor:Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.qr_code_scanner_outlined),
            color: Colors.black,
            highlightColor:Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz_outlined),
            color: Colors.black,
            highlightColor:Colors.transparent,
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
      )
    );
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

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: 300,
            child: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.cyan,
          )),
    );
  }
}

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
          itemBuilder: (context, position) {
    return Column(
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Expanded(child:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Padding(
    padding:
    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
    child: Text(
    "123",
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
    fontSize: 22.0, fontWeight: FontWeight.bold),
    )
    ),
    Padding(
    padding:
    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
    child: Text(
    "321",
    style: TextStyle(fontSize: 18.0),
    ),
    ),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Text(
    "5m",
    style: TextStyle(color: Colors.grey),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
    Icons.star_border,
    size: 35.0,
    color: Colors.grey,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    Divider(
    height: 2.0,
    color: Colors.grey,
    )
    ],
    );
    },
      itemCount: 20,
    )
      ),
    );
  }
}

