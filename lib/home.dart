import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'contact.dart';
import 'social.dart';
import 'news.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лицей 369',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [
    NewsListPage(),
    ContactFormPage(),
    SocialPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Image.network(
                  'http://xn--e1adhj9a.xn--369-qddohl3g.xn--p1ai/unga/wp-content/uploads/2018/10/logo123.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),*/
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '#blog',
                        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Главная')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Контакты'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Entypo.users),
            title: new Text('Social'),
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


