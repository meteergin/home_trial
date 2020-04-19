import 'package:flutter/material.dart';
import 'package:home_trial/models/photo.dart';
import 'package:home_trial/models/user.dart';
import 'package:home_trial/services/photoService.dart';
import 'package:home_trial/views/photoList.dart';
import 'package:http/http.dart' as http;

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    final PhotoService photoService = new PhotoService();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey, Colors.lightBlueAccent]),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Welcome " + user.username,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black38,
            ),
          ),
          FutureBuilder<List<Photo>>(
            future: photoService.fetchPhotos(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? PhotosList(photos: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
