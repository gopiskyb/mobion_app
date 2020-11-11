import 'package:flutter/material.dart';
import 'package:mobion_app/logout.dart';
import 'package:mobion_app/more.dart';
import 'package:mobion_app/sip.dart';
import 'package:mobion_app/HomePage.dart';
import 'package:mobion_app/History.dart';
import 'package:mobion_app/Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Mobion"),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (content) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("SIP"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Logout"),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text("More"),
                  ),
                ],
                onSelected: (int menu){
                  if(menu == 1){
                    navigatorKey.currentState
                        .push(MaterialPageRoute(builder: (context) => SIP()));
                  }else if(menu == 2){
                    navigatorKey.currentState
                        .push(MaterialPageRoute(builder: (context) => Logout()));
                  }
                  else if(menu == 3){
                    navigatorKey.currentState
                        .push(MaterialPageRoute(builder: (context) => More()));
                  }
                },
              ),
            ],
          ),
          body: MyHomePage(),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  int _selectedIndexForTabBar = 0;

  final _pageOptions = [
    /*   Text('Home Page',style: TextStyle(fontSize: 36.0),),
    Text('Item 2',style: TextStyle(fontSize: 36.0),),
    Text('Item 3',style: TextStyle(fontSize: 36.0),),*/
    HomePage(),
    History(),
    Settings(),
  ];

  static List<Widget> _listOfIconsForTabBar = <Widget>[
    Icon(Icons.dialpad),
    Icon(Icons.contacts),
  ];

  void _onItemTappedForTabBar(int index){
    setState(() {
      _selectedIndexForTabBar = index+1;
    });
  }

  @override
  Widget build(BuildContext context) {

    final tabBar = new TabBar(labelColor: Colors.blue,
      onTap: _onItemTappedForTabBar,
      tabs:<Widget> [
        new Tab(
            text: 'DialPad'
        ),
        new Tab(
            text: 'Call Logs'
        ),
      ],

    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:
        /* Center(
              child: _selectedIndexForTabBar == 0 ?
              _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar -1)),*/
        _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text('History')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings')
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.dialpad),
        ),
      ),
    );
  }
}
