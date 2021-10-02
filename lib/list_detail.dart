import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {
  final String content;
  ListDetail(this.content);

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
            Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg',
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ひろむ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '@myIDdesu',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                content,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text('03:09・2021年10月1日',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
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
