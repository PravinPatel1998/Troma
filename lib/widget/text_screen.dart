import 'package:flutter/material.dart';
import 'package:troma_demo/widget/app_font.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello flutter developers here is a normal text"),
            Text(
              "This text with customize style with color , size ,",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: AppFont.fontInter,
                  fontWeight: FontWeight.w100),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Click me"))
          ],
        ),
      ),
    );
  }
}
