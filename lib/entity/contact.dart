import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Widget response = Container();

  void getData(String name) async {
    Widget responseCreate;
    await getResponse().then((value) {
      responseCreate = Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone number'),
                  Text(value.contacts[name].phone)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Email'), Text(value.contacts[name].email)],
              ),
            ),
          ],
        ),
      );
    }).catchError((e) {
      responseCreate = Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('error'), Text(e.toString())],
              ),
            ),
          ],
        ),
      );
    });
    setState(() {
      response = responseCreate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SkyLiner multimedia')),
      body: Container(
        child: ListView(
          children: [
            RaisedButton(
              onPressed: () {
                getData("Nataliia");
              },
              color: Colors.grey.withOpacity(0.25),
              child: const Text('Nataliia', style: TextStyle(fontSize: 20)),
            ),
            RaisedButton(
              onPressed: () {
                getData("Oksana");
              },
              color: Colors.grey.withOpacity(0.25),
              child: const Text('Oksana', style: TextStyle(fontSize: 20)),
            ),
            response,
            Container(
              height: 600,
            ),
          ],
        ),
      ),
    );
  }
}

Future<ListOfContacts> getResponse() async {
  final response =
      await http.get('https://api.jsonbin.io/b/5fe4fdc4d151a57b8937a928');

  if (response.statusCode == 200) {
    return ListOfContacts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load info');
  }
}

class ContactData {
  final email;
  final phone;

  ContactData({this.email, this.phone});
}

class ListOfContacts {
  final Map<String, ContactData> contacts;

  ListOfContacts(this.contacts);

  factory ListOfContacts.fromJson(Map<String, dynamic> json) {
    final Map<String, ContactData> contacts = new Map.fromIterable(json.keys,
        key: (item) => item.toString(),
        value: (item) => ContactData(
            email: json[item]["email"], phone: json[item]["phone"]));
    return ListOfContacts(contacts);
  }
}
