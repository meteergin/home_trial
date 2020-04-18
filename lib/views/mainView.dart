import 'package:flutter/material.dart';
import 'package:home_trial/models/user.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey, Colors.lightBlueAccent]),
      ),
      child: Text(
        "Welcome " + user.username,
        style: TextStyle(
          fontSize: 70,
          color: Colors.black38,
        ),
      ),
    );
  }
}
