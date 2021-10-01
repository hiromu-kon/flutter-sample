import 'package:flutter/material.dart';
import 'package:sample/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Twitter Clone',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg',
                  width: 200,
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            Text('ひろむ'),
            Text('@myIDdesu'),
            Text('111フォロ-'),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('プロフィール'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.article_outlined),
              title: Text('リスト'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.article_outlined),
              title: Text('トピック'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border),
              title: Text('ブックマーク'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('設定とプライバシー'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('ヘルプセンター'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('まだ何も投稿されていません'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.article_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextPage(),
              fullscreenDialog: true,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), title: Text('ホーム')),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), title: Text('ホーム')),
        ],
      ),
    );
  }
}
