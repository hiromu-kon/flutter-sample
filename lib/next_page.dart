import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class NextPage extends StatefulWidget {
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
            padding: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
            child: ElevatedButton(
              child: const Text('ツイートする'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                context.read<TweetProvider>().addList(content);
                Navigator.pop(context);
              },
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
