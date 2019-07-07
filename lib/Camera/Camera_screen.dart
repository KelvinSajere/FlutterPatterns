import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final CameraController _controller;
  final Future<void> _initializeControllerFuture;
  const CameraScreen(
      {Key key,
      @required CameraController controller,
      initializeControllerFuture})
      : _controller = controller,
        _initializeControllerFuture = initializeControllerFuture,
        super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: widget._initializeControllerFuture,
      builder: (context, snapshot) {
        var state = snapshot.connectionState;
        print('THIS IS HTE STUPID STATE *********************** $snapshot');
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(widget._controller);
        } else {
          // Otherwise, display a loading indicator.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
