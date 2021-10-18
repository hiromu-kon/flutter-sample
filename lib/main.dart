import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/next_page.dart';
import 'package:sample/provider.dart';
import 'package:provider/provider.dart';

import 'list_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TweetProvider>(create: (_) => TweetProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg',
                      )),
                  Icon(Icons.more_horiz),
                ],
              ),
              const Text('ひろむ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      height: 2)),
              const Text('@myIDdesu',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              RichText(
                text: const TextSpan(
                  style:
                      TextStyle(color: Colors.black, fontSize: 13, height: 2),
                  children: <TextSpan>[
                    TextSpan(
                        text: '111',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'フォロー',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    TextSpan(
                        text: ' 9,999,999',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, wordSpacing: 10)),
                    TextSpan(
                        text: 'フォロワー', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, right: 0),
                child: ListTile(
                  leading: Transform.translate(
                    offset: const Offset(-16, 0),
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  title: Transform.translate(
                    offset: const Offset(-16, 0),
                    child: const Text(
                      'プロフィール',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Icon(Icons.article_outlined,
                      color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Text(
                    'リスト',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Icon(Icons.article_outlined,
                      color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Text(
                    'トピック',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                    offset: const Offset(-16, 0),
                    child: const Icon(Icons.bookmark_border,
                        color: Colors.black, size: 28)),
                title: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Text(
                    'ブックマーク',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                  offset: const Offset(-16, 0),
                  child:
                      const Icon(Icons.settings, color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Text(
                    '設定とプライバシー',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Icon(Icons.help_outline,
                      color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const Text(
                    'ヘルプセンター',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            onTap: () {
              _key.currentState!.openDrawer();
            }),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: const Text(
          'Twitter Clone',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: context.watch<TweetProvider>().list.isEmpty
          ? Container(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('まだ何も投稿されていません'),
                ],
              ),
            )
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('tweet')
                  .doc()
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'ひろむ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              '@myIDdesu',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Text('0時間前',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                              size: 16,
                            )
                          ],
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.docs[index].data['tweet'],
                                style: const TextStyle(color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.mode_comment_outlined,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.repeat_outlined,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                      size: 18,
                                    )
                                  ],
                                ),
                              )
                            ]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListDetail(
                                  context.watch<TweetProvider>().list[index]),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black12,
                    height: 3,
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.article_outlined),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextPage(),
              fullscreenDialog: true,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), title: Text('ホーム')),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('ホーム'),
          ),
        ],
      ),
    );
  }
}
