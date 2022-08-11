import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogueController extends GetxController {
  MyData myData = MyData();

  // var nameController = "".obs;
  //
  // var date = "".obs;
  //
  // var dropDownValue = "1".obs;

  var items = [1, 2, 3, 4, 5].obs;

  var isValidate = false.obs;

  // validation() {
  //   if (nameController.value != "" &&
  //       date.value != "" &&
  //       dropDownValue.value != "") {
  //     isValidate.value = true;
  //     return true;
  //   } else {
  //     return false;
  //   }
  //}

  setMyData(MyData model) {
    myData = model;
    update();
  }
}

class MyData {
  final String? name;
  final String? date;
  final String? dropValue;

  MyData({this.name, this.date, this.dropValue});
}
