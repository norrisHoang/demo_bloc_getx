import 'package:demo_getx_bloc/get_x/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXScreen extends GetWidget {
  final GetXController _controller = Get.find();
  final TextEditingController _textEditingController = TextEditingController();

  GetXScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              _buildText(context, _textEditingController),
              const SizedBox(height: 20),
              _buildButton(context, _textEditingController)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(
      BuildContext context, TextEditingController textEditingController) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Obx(() => Text(_controller.text.toString())));
  }

  Widget _buildButton(
      BuildContext context, TextEditingController textEditingController) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          height: 50,
          width: 100,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            'Pop GetX',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
