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
        title: Text(
          'テスト',
          style: TextStyle(
              color: onPressed == true ? Colors.redAccent : Colors.black87),
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Icon(Icons.add_a_photo)],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network(
                'https://images.unsplash.com/photo-1586227740560-8cf2732c1531?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1861&q=80'),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  onPressed = !onPressed;
                  print(onPressed);
                });
              },
              icon: Icon(Icons.input)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => NextPage()));
              },
              child: Text('次のページへ')),
        ],
      ),
    );
  }
}
