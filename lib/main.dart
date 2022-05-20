import 'package:demo_getx_bloc/data_bloc/main_bloc.dart';
import 'package:demo_getx_bloc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MainBloc.allBlocs(),
        child: MaterialApp(
          title: 'Demo GetX and Bloc',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
  }
}
