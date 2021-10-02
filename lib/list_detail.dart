import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  const ListDetail({Key? key}) : super(key: key);

  @override
  _ListDetailState createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.1,
        title: const Text(
          'ツイート',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg',
                )),
            Text(
              'Hello World!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('03:09・2021年10月1日',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            Divider(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.mode_comment_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                Icon(
                  Icons.repeat_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
