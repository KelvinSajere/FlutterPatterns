import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import './index.dart';

class MycameraBloc extends Bloc<MycameraEvent, MycameraState> {
  Future<void> _initializeControllerFuture;
  CameraController _controller;

  Future<void> getInitControllerFuture() {
    return this._initializeControllerFuture;
  }

  CameraController getController() {
    return this._controller;
  }

  @override
  MycameraState get initialState => InitialMycameraState();

  @override
  Stream<MycameraState> mapEventToState(
    MycameraEvent event,
  ) async* {
    if (event is MyCameraPagePressed) {
      final cameras = await availableCameras();
      final _camera = cameras.first;
      this._controller = CameraController(
          // Get a specific camera from the list of available cameras.
          _camera,
          // Define the resolution to use.
          ResolutionPreset.medium);
      this._initializeControllerFuture = this._controller.initialize();
      yield LoadingCameraState();
    }
    yield currentState;
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }
}
