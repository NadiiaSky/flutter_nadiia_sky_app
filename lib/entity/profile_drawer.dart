import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const IconData account_circle_outlined = IconData(0xe010, fontFamily: 'MaterialIcons');

class ProfileDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
          Expanded(
            flex: 10,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child:Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: profilePhoto(),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Nadiia Skyba'),
                                Text('View profile')
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ) ,
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(top: 20, left: 20),
                  leading: Icon(Icons.assignment_ind),
                  title: Text('Main Page'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    // Then close the drawer.
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(Icons.pageview),
                  title: Text('Contacts'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(Icons.bookmark_border),
                  title: Text('Bookmark'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(Icons.brightness_5),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(bottom: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Icon(Icons.question_answer),
                      Text('Ask a question:'),
                      //Text("@NadiiaSky"),
                    ],
                  ),
                  Text("@NadiiaSky"),
                ],
              ),
            ),
          )
        ],
        ),

    );
  }

}



Widget profilePhoto() => Stack(
  alignment: const Alignment(0.6, 0.6),
  children: [
    CircleAvatar(
      backgroundImage: AssetImage('image/avatar.jpg'),
      radius: 65,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Text(
        'NadiiaSky',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    ),
  ],
);