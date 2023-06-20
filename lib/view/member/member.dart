import 'package:flutter/material.dart';
import 'package:my_app/db/LocalDB.dart';
import 'package:my_app/view/member/memberVM.dart';
import 'package:provider/provider.dart';

import '../../model/Album.dart';

class Member extends StatefulWidget {

  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> {

  double fontsize = 22.0;
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<MemberVM>(
            create: (_) => MemberVM(),
            child: Consumer<MemberVM>(
                builder: (context, MemberVM viewModel, child) {
                  viewModel.getData();
                  return _body(viewModel);
                })));
  }

  Widget _body(MemberVM vm) {
    return
      Center(
        child: ListView.builder(
          itemBuilder: (context, position) {
            return InkWell(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(12.0, position == 3 && clicked ? fontsize : 12.0, 12.0, position == 3 && clicked ? fontsize : 12.0),
                                child: Text(
                                  vm.album?[position].title ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: position == 3 && clicked ? fontsize : 22.0, fontWeight: FontWeight.bold),
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                              child: Text(
                                vm.album?[position].userId.toString() ?? "",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "5m",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
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
              ),
              onTap: () =>_onTap(vm, position),
            );
          },
          itemCount: vm.album?.length ?? 0,
        ));
  }

  List<Map<String, dynamic>> myData = [];

  void _onTap(MemberVM vm, int position) {
    if (position == 3){
      fontsize = 32.0;
      clicked = !clicked;
      addItem(vm.album?[position].userId ??0, vm.album?[position].title??"");
      _refreshData();
    }
  }

  // Insert a new data to the database
  Future<void> addItem(int userId, String title) async {
    await LocalDB.createItem(userId, title);
  }

  void _refreshData() async {
    final data = await LocalDB.getItems();
    myData = data;
    print(myData);
  }
}





