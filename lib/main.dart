import 'package:flutter/material.dart';
import 'package:slider/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI calculator"),

          backgroundColor: Colors.deepPurpleAccent,
        ),
        drawer: const NavigationDrawer(),
        body: Calculator(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenu(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
);
Widget buildMenu(BuildContext context) => Container(
  child: Column(
    children: [
      ListTile(
        leading: const Icon(Icons.calculate),
        title: Text("BMI calculator 2nd version"),
        onTap: () {

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Calculator(),
          ),);
        }
      ),
    ],
  ),
);