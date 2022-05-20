import 'package:get/get.dart';

class GetXController extends GetxController{
  RxString text = ''.obs;

  void sendTextController(RxString textData){
    text = textData;
  }
}