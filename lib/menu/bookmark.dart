import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nadiiasky_flutter_app/entity/postslist.dart';
import 'package:nadiiasky_flutter_app/model/AppModel.dart';
import 'package:provider/provider.dart';


class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

var savedNotes = Set<String>();
class _BookmarkState extends State<Bookmark> {
  String text;

  Widget buildNote() {
    return GestureDetector(
      onTap: () {
        setState(() {
          savedNotes.add(this.text);
        });
      },
    );
  }


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
    TextEditingController myController = TextEditingController(
      text: text,
    );
    setState(() {
      text = ModalRoute
          .of(context)
          .settings
          .arguments;
    });
    //var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: AlertDialog(
        title: Text("Put you notice here"),
        content: TextField(
          controller: myController,
        ),
        actions: <Widget>[
          //buildNote(),
          MaterialButton(
            elevation: 5.0,
            child: Text("Ok"),
            onPressed: () {
              pressOk(myController.text);
              //Navigator.of(context).pop(customController.text.toString());
            },
          ),
        ],
      ),
    );
  }

}











// Future<void> pressOk(text) async {
//   String res = await Navigator.push(context, MaterialPageRoute(
//       builder: (context) {
//         Provider
//             .of<AppModel>(context, listen: false)
//             .text;
//         final tiles = savedNotes.map(
//             (String text) {
//               return ListTile(
//                 title: Text(
//                     text,
//                 ),
//               );
//             },
//         );
//         final divided = ListTile.divideTiles(
//           context: context,
//           tiles: tiles,
//         ).toList();
//         return Scaffold(
//           body: ListView(children: divided),
//         );
//       }));
//   setState(() {
//     text = res;
//   });
//   Provider.of<AppModel>(context, listen: false).text = res;
// }