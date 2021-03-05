import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/model/launch.dart';
import 'package:flutter_app_project/ui/Details.dart';
import 'package:flutter_app_project/ui/home.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot Discovery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch(settings.name){
          case Details.route:
            Launch launch;
            if(arguments is LaunchDetailsArguments){
              launch = arguments.launch;
            }
            return MaterialPageRoute(builder: (_) => Details(launch,launch.links.patch.small));
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(child: Text("Route inconnue")),
                ));
        }
      },
      home: HomePage(title: 'App Project'),
    );
  }
}
