import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

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
