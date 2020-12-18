import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(
                                //   //margin: const EdgeInsets.only(top: 8),
                                //   child: Text(
                                //     'Nadiia Skyba',
                                //     style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w400,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                // Container(
                                //   child: Text(
                                //     'View profile',
                                //     style: TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
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
                  leading: Icon(Icons.assignment_ind),
                  title: Text('Main Page'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.pageview),
                  title: Text('Contacts'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_border),
                  title: Text('Bookmark'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.question_answer),
                      Text('Ask a question'),
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