import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([Iterable props]) : super(props);

  /// Copy object for use in action
  HomeState getStateCopy();
}

/// Initialized
class InHomeState extends HomeState {
  @override
  String toString() => 'InHomeState';

  @override
  InHomeState getStateCopy() {
    return InHomeState();
  }
}
