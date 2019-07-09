import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MycameraEvent extends Equatable {
  MycameraEvent([List props = const []]) : super(props);
}

class MyCameraPagePressed extends MycameraEvent {
  @override
  String toString() => "MyCameraPagePressed";
}

class TakePicture extends MycameraEvent {
  @override
  String toString() => "TakePicture";
}
