import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'cameraScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  loadmodel() async {
    Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();

    loadmodel();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 50,
            width: w,
            child: MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(),
                  ),
                );
              },
              child: Text(
                'Start Detecting',
              ),
            ),
          ),
        ),
      ),
    );
  }
}