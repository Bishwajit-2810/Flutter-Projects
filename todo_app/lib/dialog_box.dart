import 'package:flutter/material.dart';
import 'package:todo_app/my_button.dart';

class DialogBox extends StatelessWidget {
  TextEditingController newTask;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.newTask,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: newTask,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "add a task",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonName: "save", onPressed: onSave),
                const SizedBox(
                  width: 5,
                ),
                MyButton(buttonName: "cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
