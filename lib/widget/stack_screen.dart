import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
        ),
        Positioned(
          bottom: -50,
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueGrey,
              child: Center(child: Text("P")),
            ),
          ),
        )
      ],
    ));
  }
}
