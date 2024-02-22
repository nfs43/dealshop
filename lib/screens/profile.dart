import 'package:dealshop/theme.dart';
import 'package:dealshop/widgets/HorizontalLine.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = 'John Doe';
  List<Map<String, dynamic>> dataList = [
    {'icon': Icons.person, 'text': 'Personal Information'},
    {'icon': Icons.security, 'text': 'Login & Security'},
    {'icon': Icons.payment, 'text': 'Payment and Payouts'},
    {'icon': Icons.calculate, 'text': 'Taxes'},
    {'icon': Icons.translate, 'text': 'Translation'},
    {'icon': Icons.notifications, 'text': 'Notifications'},
    {'icon': Icons.privacy_tip, 'text': 'Privacy and Sharing'},
    {'icon': Icons.work, 'text': 'Travel for Work'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 25, color: black),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildListItem(
                        dataList[index]['icon'], dataList[index]['text']);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(IconData icon, String text) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: ListTile(
            leading: Icon(icon),
            title: Text(text),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Add your onTap logic here
            },
          ),
        ),
        HorizontalLine()
      ],
    );
  }
}
