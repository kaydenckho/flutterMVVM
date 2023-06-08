import 'package:flutter/material.dart';
import 'package:my_app/viewModel/memberVM.dart';
import 'package:provider/provider.dart';

class Member extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<MemberVM>(
          create: (_) => MemberVM(),
          child: Consumer<MemberVM>(
              builder: (context, MemberVM viewModel, child) {
                viewModel.getData();
                return _body(viewModel);
              })
        )
    );
  }

  Widget _body(MemberVM vm) {
    return Center(
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding:
                            EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                            child: Text(
                              vm.album?[position].title ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            )
                        ),
                        Padding(
                          padding:
                          EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
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
            );
          },
          itemCount: vm.album?.length ?? 0,
        )
    );
  }


}