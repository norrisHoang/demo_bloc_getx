import 'package:flutter/material.dart';

class RiverpodScreen extends StatefulWidget {
  const RiverpodScreen({Key? key}) : super(key: key);

  @override
  State<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends State<RiverpodScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [_buildTextInput(context), _buildButton(context)],
      ),
    ));
  }

  Widget _buildTextInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(controller: _textEditingController),
    );
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 50,
          width: 100,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            'Riverpod',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
