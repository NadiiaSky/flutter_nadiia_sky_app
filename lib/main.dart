// Nadiia Skyba, TI-72. All rights reserved.


import 'package:nadiiasky_flutter_app/entity/postslist.dart';
import 'package:flutter/material.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsList(),
    );
  }
}
