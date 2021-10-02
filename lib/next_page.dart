import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final List list;

  const NextPage({Key? key, required this.list}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  var content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              child: const Text('ツイートする'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: const StadiumBorder(),
              ),
              onPressed: () => setState(() {
                widget.list.add(content);

                Navigator.pop(context, widget.list);
              }),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
        ),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'いまどうしてる？',
          ),
          onChanged: (value) {
            content = value;
          },
        ),
      ),
    );
  }
}
