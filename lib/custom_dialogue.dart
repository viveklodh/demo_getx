import 'package:demo/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogBox extends StatelessWidget {
  CustomDialogBox({Key? key}) : super(key: key);

  DateTime selectedDate = DateTime.now();
  String? dropDownValue;

  TextEditingController nameController = TextEditingController();

  DialogueController dialogueController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        color: Colors.white,
        width: 500,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                onChanged: (v) {
                  dialogueController.nameController.value = v;
                },
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              IconButton(
                  onPressed: () {
                    selectDate(context);
                  },
                  icon: Icon(Icons.date_range)),
              SizedBox(
                height: 22,
              ),
              DropdownButtonFormField<int>(
                value: dialogueController.items[0],
                items: dialogueController.items
                    .map((label) => DropdownMenuItem(
                          child: Text(label.toString()),
                          value: label,
                        ))
                    .toList(),
                hint: Text('Rating'),
                onChanged: (value) {
                  dialogueController.dropDownValue.value = value.toString();
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      if (dialogueController.validation()) {
                        Navigator.pop(context);
                      } else {
                        print("not validate");
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dialogueController.date.value = selectedDate.toString();
    }
  }
}
