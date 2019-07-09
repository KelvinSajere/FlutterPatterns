import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:quicksnap/mycamera/index.dart';
import 'package:quicksnap/mycamera/mycamera_bloc.dart';
import 'package:bloc/bloc.dart';

class MyCameraBlocBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _camerBloc = BlocProvider.of<MycameraBloc>(context);
    return BlocBuilder<MycameraEvent, MycameraState>(
      bloc: _camerBloc,
      builder: (BuildContext context, MycameraState state) {
        return MyCameraPage(
          bloc: _camerBloc,
        );
      },
    );
  }
}

class MyCameraPage extends StatefulWidget {
  final MycameraBloc _bloc;
  const MyCameraPage({
    Key key,
    @required Bloc bloc,
  })  : _bloc = bloc,
        super(key: key);

  @override
  _MyCameraPageState createState() => _MyCameraPageState();
}

class _MyCameraPageState extends State<MyCameraPage> {
  @override
  void initState() {
    super.initState();
    widget._bloc.dispatch(MyCameraPagePressed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Take A Picture'),
        ),
        body: FutureBuilder<void>(
          future: widget._bloc.getInitControllerFuture(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(widget._bloc.getController());
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
              child: Icon(Icons.camera_enhance),
              onPressed: () async {
                // widget._bloc.dispatch(event)
              }),
        ));
  }
}
