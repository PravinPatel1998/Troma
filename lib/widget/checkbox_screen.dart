import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool isChecked = false;
  bool isCheckedWithTile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (onChanged) {
                      setState(() {
                        isChecked = onChanged!;
                      });
                    }),
                Text("Terms & Conditions")
              ],
            ),
            CheckboxListTile(
                title: Text("Checkbox tile"),
                value: isCheckedWithTile,
                subtitle: Text("subtitle"),
                secondary: Icon(Icons.access_alarm),
                onChanged: (onChanged) {
                  setState(() {
                    isCheckedWithTile = onChanged!;
                  });
                }),
            OutlinedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg:
                          "Simple Checkbox : $isChecked \n CheckboxTile : $isCheckedWithTile");
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
