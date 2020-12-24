// Nadiia Skyba, TI-72. All rights reserved.

import 'package:nadiiasky_flutter_app/consumer/consumer.dart';
import 'package:nadiiasky_flutter_app/entity/contact.dart';
import 'package:nadiiasky_flutter_app/entity/postslist.dart';
import 'package:flutter/material.dart';
import 'package:nadiiasky_flutter_app/entity/profile_drawer.dart';
import 'package:nadiiasky_flutter_app/entity/saved.dart';
import 'package:nadiiasky_flutter_app/model/AppModel.dart';
import 'package:provider/provider.dart';

import 'menu/bookmark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //String title;
  //String text;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
      create: (context) => AppModel(),
      child: MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.red[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => PostsList(),
          '/bookmark': (context) => Bookmark(),
          '/contacts': (context) => Contact(),
        },
        // home: Scaffold(
        //   body: MyConsumer(),
        //   //drawer: ProfileDrawer(),
        // ),
      ),
    );
  }
}
