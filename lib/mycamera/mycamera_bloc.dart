import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import './index.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class MycameraBloc extends Bloc<MycameraEvent, MycameraState> {
  //singleton ensure that every time we create a new instance of the bloc, we have the current state

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
      _setUpCamera();
      yield LoadingCameraState();
    } else if (event is TakePicture) {
      final path = await _takePicture();
      yield PictureTakenState(path: path);
    } else {
      yield currentState;
    }
  }

  void _setUpCamera() async {
    final cameras = await availableCameras();
    final _camera = cameras.first;
    this._controller = CameraController(
        // Get a specific camera from the list of available cameras.
        _camera,
        // Define the resolution to use.
        ResolutionPreset.medium);
    this._initializeControllerFuture = this._controller.initialize();
  }

  Future<String> _takePicture() async {
    await this._initializeControllerFuture;

    // Construct the path where the image should be saved using the
    // pattern package.
    final path = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.png',
    );

    // Attempt to take a picture and log where it's been saved.
    await this._controller.takePicture(path);

    return path;
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }
}
