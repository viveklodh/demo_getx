import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';
import 'custom_dialogue.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dialogueController = Get.put(DialogueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("home page"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialogBox();
                      });
                },
                icon: Icon(Icons.add),
              ),
            ),
            
          ],
        ),
        body: GetBuilder<DialogueController>(builder: (dialogueController) {
           if (dialogueController.myData.name == null) {
              return Center(child: CircularProgressIndicator());
            }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(dialogueController.myData.name.toString()),
                    Text(dialogueController.myData.date.toString()),
                    Text(dialogueController.myData.dropValue.toString()),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
