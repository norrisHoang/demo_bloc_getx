import 'dart:developer';

import 'package:demo_getx_bloc/get_x/getx_controller.dart';
import 'package:demo_getx_bloc/get_x/getx_screen.dart';
import 'package:demo_getx_bloc/riverpod/riverpod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'data_bloc/data_bloc.dart';
import 'data_bloc/data_event.dart';
import 'data_bloc/data_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetXController _controller = Get.put(GetXController());
  String text = '';
  final TextEditingController _textGetXController = TextEditingController();
  final TextEditingController _textBlocController = TextEditingController();
  final TextEditingController _textRiverpodController = TextEditingController();

  // Send data to use Bloc
  _handleSendTextBloc(TextEditingController textEditingController) {
    BlocProvider.of<DataBloc>(context)
        .add(RequestSendDataEvent(textEditingController.text));
  }

  // Send data to use GetX
  _handleSendTextGetX(TextEditingController textEditingController) {
    _controller.sendTextController(textEditingController.text.obs);
    Navigator.push(context, MaterialPageRoute(builder: (context) => GetXScreen()));
  }

  _handleSendTextRiverpod(TextEditingController textEditingController) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RiverpodScreen()));
  }

  @override
  void dispose() {
    _textGetXController.dispose();
    _textBlocController.dispose();
    _textRiverpodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataSate>(
        builder: (context, state) => _buildUI(context),
        listener: (context, state) {
          if (state is DataLoading) {
            log('Loading');
          } else if (state is DataLoaded) {
            text = state.text;
          } else if (state is DataError) {
            log(state.message);
          }
        });
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildTextInput(context, _textGetXController),
              _buildButton(context, 'GetX', _textGetXController),
              const SizedBox(height: 30),
              _buildTextInput(context, _textBlocController),
              _buildButton(context, 'Bloc', _textBlocController),
              const SizedBox(height: 30),
              _buildTextInput(context, _textRiverpodController),
              _buildButton(context, 'Riverpod', _textRiverpodController),
              const SizedBox(height: 30),
              _buildText(context, 'Bloc', text),
              _buildText(context, 'Riverpod', ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput(
      BuildContext context, TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(controller: textEditingController),
    );
  }

  Widget _buildButton(BuildContext context, String text,
      TextEditingController textEditingController) {
    return GestureDetector(
      onTap: () {
        switch (text.toLowerCase()) {
          case 'getx':
            {
              _handleSendTextGetX(textEditingController);
              break;
            }
          case 'bloc':
            {
              _handleSendTextBloc(textEditingController);
              break;
            }
          case 'riverpod':
            {
              _handleSendTextRiverpod(textEditingController);
              break;
            }
        }
      },
      child: Container(
          height: 50,
          width: 100,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _buildText(BuildContext context, String title, String text) {
    return Row(
      children: [
        Text('$title :'),
        const SizedBox(width: 20),
        Text(text),
      ],
    );
  }
}
