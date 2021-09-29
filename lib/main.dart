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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Twitter Clone',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.add_a_photo)],
        ),
      ),
      body: Column(
        children: [
          Text('まだ何も投稿されていません'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.article_outlined),
        onPressed: () {},
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
