import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:camera/camera.dart';

@immutable
abstract class MycameraState extends Equatable {
  MycameraState([List props = const []]) : super(props);
}

class InitialMycameraState extends MycameraState {
  @override
  String toString() => "InitialMyCameraState";
}

class LoadingCameraState extends MycameraState {
  @override
  String toString() => "LoadingCameraState";
}

class CameraLoadedState extends MycameraState {
  final CameraController controller;
  final ConnectionState connectionState;

  CameraLoadedState({@required this.controller, @required this.connectionState})
      : super([controller, connectionState]);

  CameraController getController() {
    return controller;
  }

  @override
  String toString() =>
      "CameraLoadedState { controller: $controller, connectionState:$connectionState }";
}
