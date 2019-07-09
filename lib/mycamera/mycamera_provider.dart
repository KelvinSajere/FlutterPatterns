import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicksnap/mycamera/index.dart';

class CameraBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MycameraBloc>(
      builder: (BuildContext context) => MycameraBloc(),
      child: MyCameraBlocBuilder(),
    );
  }
}
