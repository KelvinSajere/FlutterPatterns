import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import './index.dart';

class MycameraBloc extends Bloc<MycameraEvent, MycameraState> {
  Future<void> initializeControllerFuture;
  CameraController controller;

  @override
  MycameraState get initialState => InitialMycameraState();

  @override
  Stream<MycameraState> mapEventToState(
    MycameraEvent event,
  ) async* {
    final cameras = await availableCameras();
    final _camera = cameras.first;
    controller = CameraController(
        // Get a specific camera from the list of available cameras.
        _camera,
        // Define the resolution to use.
        ResolutionPreset.medium);
    initializeControllerFuture = controller.initialize();
    yield LoadingCameraState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
