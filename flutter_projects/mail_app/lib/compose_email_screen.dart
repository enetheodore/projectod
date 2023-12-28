import 'package:flutter/material.dart';
import 'package:mail_app/data.dart';

class ComposeScreen extends StatelessWidget {
  ComposeScreen({Key key}) : super(key: key);
  final List<String> menuTabItems = [
    'Schedule send',
    "Confidential Mode",
    "Discard",
    "Settings",
    "help and feedback"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 24,
            color: Colors.black54,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Compose',
            style: TextStyle(color: Colors.black54),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.attachment_outlined),
              iconSize: 24,
              color: Colors.black54,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 24,
              color: Colors.black54,
              onPressed: () {},
            ),
            InkWell(
              child: PopupMenuButton(
                iconSize: 24,
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.black54,
                ),
                itemBuilder: (context) => menuTabItems
                    .map(
                      (itemName) => PopupMenuItem(
                        child: Text(itemName),
                        value: itemName,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: kPadding),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: kPadding - 7,
                        left: kPadding - 10,
                        right: kPadding - 10),
                    child: Text(
                      'From',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  hintText: 'example@mail.com',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.expand_more),
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: kPadding - 4),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: kPadding - 7,
                        left: kPadding - 10,
                        right: kPadding - 10),
                    child: Text(
                      'To',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.expand_more),
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: kPadding - 10,
                      left: kPadding - 10,
                      right: kPadding - 10),
                  hintText: 'Subject',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: kPadding - 10,
                      left: kPadding - 10,
                      right: kPadding - 10),
                  hintText: 'Compose',
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ));
  }
}
