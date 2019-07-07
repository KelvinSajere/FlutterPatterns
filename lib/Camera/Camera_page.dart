import 'package:flutter/material.dart';
import 'package:quicksnap/Camera/index.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
        ),
        body: CameraScreen(),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
              child: Icon(Icons.camera_enhance), onPressed: () => {}),
        ));
  }
}
