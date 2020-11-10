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
        /*appBar: AppBar(
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
        ),*/
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
  int _selectedIndexForBottomNavigationBar = 0;
  int _selectedIndexForTabBar = 0;
  final navigatorKey = GlobalKey<NavigatorState>();


  //1
  static List<Widget> _listOfIconsForBottomNavigationBar = <Widget>[
    Icon(Icons.home),
    Icon(Icons.contacts),
    Icon(Icons.settings),
  ];


  //2
  static List<Widget> _listOfIconsForTabBar = <Widget>[
    Icon(Icons.dialpad),
    Icon(Icons.history),
    // Icon(Icons.directions_railway),
  ];


  //3
  void _onItemTappedForBottomNavigationBar(int index) {
    setState(() {
      _selectedIndexForBottomNavigationBar = index;
      _selectedIndexForTabBar = 0;
    });
  }


  //4
  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index+1;
      _selectedIndexForBottomNavigationBar = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    navigatorKey: navigatorKey;

    //5
    final tabBar = new TabBar(labelColor: Colors.white,
      onTap: _onItemTappedForTabBar,
      tabs: <Widget>[
        new Tab(
          text: "DialPad",
        ),
        new Tab(
          text: "Call Log",
        ),
        /*new Tab(
          text: "RAILWAY",
        ),*/
      ],
    );

    //6
    return new DefaultTabController(length: 2, child: new Scaffold(
      appBar: AppBar(bottom: tabBar,backgroundColor: Colors.blue, title: Text('Mobion'),
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

      //7
      body: Center(child:_selectedIndexForTabBar == 0 ?
      _listOfIconsForBottomNavigationBar.elementAt(_selectedIndexForBottomNavigationBar):
      _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar - 1)),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTappedForBottomNavigationBar, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.contacts),title: Text('Contacts')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),title: Text('Settings')),

        ],
        currentIndex: _selectedIndexForBottomNavigationBar,
      ),
    ));
  }
}
