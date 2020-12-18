import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nadiiasky_flutter_app/entity/profile_drawer.dart';

import '../entity/favorite.dart';


class PostsList extends StatefulWidget {
  @override
  State<PostsList> createState() => _PostsListState();

}

class _PostsListState extends State<PostsList> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('NadiiaSky multimedia demo'),
        ),
        body: Center(
          child: Container(
            child: ListView(
              //scrollDirection: Axis.vertical,
              children: [
                Post('image/flower.jpg',
                    'Oeschinen Lake Campground',
                    'Kandersteg, Switzerland',
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                    'Alps. Situated 1,578 meters above sea level, it is one of the '
                    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                    'half-hour walk through pastures and pine forest, leads you to the '
                    'lake, which warms to 20 degrees Celsius in the summer. Activities '
                    'enjoyed here include rowing, and riding the summer toboggan run.'),

                Post('image/flower.jpg',
                    'The Medditerian Sea',
                    'Turkey, Belek',
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                        'Alps. Situated 1,578 meters above sea level, it is one of the '
                        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                        'half-hour walk through pastures and pine forest, leads you to the '
                        'lake, which warms to 20 degrees Celsius in the summer. Activities '
                        'enjoyed here include rowing, and riding the summer toboggan run.'),
              ],
            ),
          ),
        ),
        drawer: ProfileDrawer(),
      ),
    );
  }
}

class Post extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String text;

  Post(this.image, this.title, this.subtitle, this.text);

  @override
  _PostState createState() => _PostState(this.image, this.title, this.subtitle, this.text);
  }

class _PostState extends State<Post> {

  final String image;
  final String title;
  final String subtitle;
  final String text;

  _PostState(this.image, this.title, this.subtitle, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              ImageSection(image),
              TitleSection(title, subtitle),
              ButtonSection(),
              TextSection(text),
            ]
        )
    );
  }
}


class ImageSection extends StatelessWidget {
  final String image;
  ImageSection(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child:
              Image.asset(
                image,
                //widget.image,
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              )
          ),
        ],
      ),
    );
  }
}


class TitleSection extends StatelessWidget{
  final String title;
  final String subtitle;
  TitleSection(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );

  }
}


  Color color = Colors.deepOrangeAccent;
  class ButtonSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.comment, 'COMMENT'),
          _buildButtonColumn(color, Icons.favorite_border, 'SAVE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  }


class TextSection extends StatelessWidget{
  final String text;
  TextSection(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        text,
        softWrap: true,
      ),
    );
  }
}


Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

