import 'package:demo_getx_bloc/data_bloc/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() => [
        BlocProvider<DataBloc>(create: (BuildContext context) => DataBloc()),
      ];
}
