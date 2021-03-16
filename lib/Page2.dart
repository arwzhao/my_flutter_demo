import 'package:flutter/material.dart';
import 'package:my_flutter_demo/util/toast.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: "Second",
          onPressed: null,
        ),
        title: new Text("2"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: new Center(
        child: new Text("Hello world"),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.pop(context, "结束");
          Toast.toast(context, "qqq");
        },
      ),
    );
  }
}
