import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/manager/api.dart';
import 'package:flutter_app_project/core/manager/apiManager.dart';
import 'package:flutter_app_project/core/model/launch.dart';
import 'package:flutter_app_project/ui/Details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Launch> launchList = List();
  final ScrollController scrollController = ScrollController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next launch : "),
      ),
      body: FutureBuilder(
        future: Api().loadContent(context),
        builder: (context, snapchot){
          if(snapchot.hasData){
            List<Launch> launchList = snapchot.data;

        return SingleChildScrollView(
          controller: scrollController,
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: launchList.length,
              itemBuilder: (context, position) {
                Launch launch = launchList[position];
              return InkWell(
                onTap: () {
                Navigator.of(context).pushNamed(Details.route,
                arguments: LaunchDetailsArguments(launch: launch));
                },
                child: Row(
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          launch.links.patch.small ?? launchList[0].links.patch.small,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                    width: 16,
                    ),
                    Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        launch.name,
                        style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                        height: 8,
                        ),
                        Text("Launch date: ${launch.date_utc.substring(0,10)}")
                        ],
                        ),
                    )
                  ],
                ),
              );
              },
          ),

        );
      } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}