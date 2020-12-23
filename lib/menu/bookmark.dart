import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nadiiasky_flutter_app/entity/postslist.dart';
import 'package:nadiiasky_flutter_app/model/AppModel.dart';
import 'package:provider/provider.dart';


class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}


class _BookmarkState extends State<Bookmark> {
  String text;

  //_BookmarkState(this.text);

  Future<void> pressOk(text) async {
    String res = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          Provider
              .of<AppModel>(context, listen: false)
              .text;
          final tiles = text.toString();
          return Scaffold(
            body: ListView(children: [
              ListTile(
                title: Text(
                    tiles
                ),

              )
            ],
            ),
          );
        }));
    setState(() {
      text = res;
    });
    Provider.of<AppModel>(context, listen: false).text = res;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController customController = TextEditingController(
      text: text,
    );
    setState(() {
      text = ModalRoute
          .of(context)
          .settings
          .arguments;
    });
    //var args = ModalRoute.of(context).settings.arguments;
    //customController.text = text;
    return Scaffold(
      body: AlertDialog(
        title: Text("Put you notice here"),
        content: TextField(
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("Ok"),
            onPressed: () {
              pressOk(customController.text);
              //Navigator.of(context).pop(customController.text.toString());
              // setState(() {
              //   text ??= ModalRoute.of(context).settings.arguments;
              // });
            },
          ),
        ],
      ),
    );
  }

}

class BookmarkText extends StatelessWidget {
  String text;

  BookmarkText(this.text);

  @override
  Widget build(BuildContext context) {
    TextEditingController customController = TextEditingController(
      //text: "hello",
    );
    //var args = ModalRoute.of(context).settings.arguments;
    //customController.text = text;
    return Scaffold(
      body: AlertDialog(
        title: Text("Put you notice here"),
        content: TextField(
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("Ok"),
            onPressed: () {
              //Navigator.of(context).pop(customController.text.toString());
              // setState(() {
              //   text ??= ModalRoute.of(context).settings.arguments;
              // });
            },
          ),
        ],
      ),
    );
  }
}