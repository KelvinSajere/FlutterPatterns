import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicksnap/Camera/index.dart';
import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CameraBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, state) {
            return CameraScreen(
                controller: bloc.controller,
                initializeControllerFuture: bloc.initializeControllerFuture);
          },
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
              child: Icon(Icons.camera_enhance), onPressed: () => {}),
        ));
  }
}
