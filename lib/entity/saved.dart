import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedWidget extends StatefulWidget {
  final String title;

  SavedWidget(this.title);

  @override
  _SavedWidgetState createState() => _SavedWidgetState(this.title);
}

var savedPosts = Set<String>();
Color color = Colors.deepOrangeAccent;

class _SavedWidgetState extends State<SavedWidget> {
  final String title;

  _SavedWidgetState(this.title);

  Widget buildPost() {
    final _isSaved = savedPosts.contains(this.title);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_isSaved) {
            savedPosts.remove(this.title);
          } else {
            savedPosts.add(this.title);
          }
        });
      },
      child: Icon(
        _isSaved ? Icons.favorite : Icons.favorite_border,
        color: _isSaved ? color : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      savedPosts ??= ModalRoute.of(context).settings.arguments;
    });
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(Icons.favorite_border, color: color),
          buildPost(),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'SAVE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
