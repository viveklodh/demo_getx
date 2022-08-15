import 'package:get/get.dart';

class DialogueController extends GetxController {
  var nameController = "".obs;

  var date = "".obs;

  var dropDownValue = "1".obs;

  var items = [1, 2, 3, 4, 5].obs;

  validation() {
    if (nameController.value != "" &&
        date.value != "" &&
        dropDownValue.value != "") {
      return true;
    } else {
      return false;
    }
  }
}
