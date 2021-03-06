import 'package:flutter/material.dart';
import 'package:marvel/pages/HeroesPage.dart';
import 'package:marvel/pages/ComicsPage.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      ),
      home: MyHomePage(title: "Marvel Heroes"),
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
  SearchBar searchBar;
  int _currentTab = 0;
  final List<Widget> listTabViews = [HeroesPage(), ComicsPage()];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Marvel Wiki'),
        actions: [searchBar.getSearchAction(context)]
    );
  }


  _MyHomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: onSubmitted,
        buildDefaultAppBar: buildAppBar
    );
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
      appBar: searchBar.build(context),
      body: listTabViews[_currentTab],
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.people),
          title: new Text("Heroes"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.book),
          title: new Text("Comics"),
        )
      ],
      currentIndex: _currentTab,
      onTap: selectedTab
      ),
    );
  }

  void selectedTab(int value) {
    setState(() {
      _currentTab = value;
    });
  }

  void onSubmitted(String value) {
    if (_currentTab == 0) {
      HeroesPage heroesPage = listTabViews[_currentTab] as HeroesPage;
      heroesPage.setSearchKey(value);
    } else if (_currentTab == 1) {

    }
  }
}
