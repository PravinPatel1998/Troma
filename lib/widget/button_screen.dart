import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            TextButton(onPressed: () {}, child: Text("Text button")),
            ElevatedButton(onPressed: () {}, child: Text("Elevated button")),
            OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                  foregroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                child: Text("Outline button")),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            IconButton(
              icon: isLike == true
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite, color: Colors.grey),
              onPressed: () {
                isLike = !isLike;
                setState(() {});
              },
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.blue, width: 1))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Text("Custom Button"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
