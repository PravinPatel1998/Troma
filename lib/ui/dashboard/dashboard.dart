import 'package:flutter/material.dart';
import 'package:troma_demo/ui/GetAPI/get_api_call_screen.dart';
import 'package:troma_demo/ui/animation/animation_screen.dart';
import 'package:troma_demo/ui/login/login_screen.dart';
import 'package:troma_demo/ui/register/register_screen.dart';
import 'package:troma_demo/widget/checkbox_screen.dart';
import 'package:troma_demo/widget/images_screen.dart';
import 'package:troma_demo/widget/stack_screen.dart';
import 'package:troma_demo/widget/text_screen.dart';

import '../../widget/button_screen.dart';
import '../../widget/list_screen.dart';
import '../../widget/slider_screen.dart';
import '../../widget/text_field_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> topics = [
    "Stack",
    "List",
    "Text",
    "Input Field",
    "Images",
    "Animation",
    "Register UI",
    "Login UI",
    "Get API",
    "Checkbox",
    "Slider",
    "Button",
    "TextField"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Topics"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.3),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return Card(
                  color: Colors.cyan,
                  child: InkWell(
                      onTap: () {
                        redirectToWidget(topics[index]);
                      },
                      child: Center(child: Text(topics[index]))));
            },
          ),
        ),
      ),
    );
  }

  void redirectToWidget(String topic) {
    switch (topic) {
      case "Stack":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StackScreen()));
        }
      case "List":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListScreen()));
        }
      case "Text":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TextScreen()));
        }
      case "Input Field":
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TextFieldScreen()));
        }
      case "Images":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => ImagesScreen()));
        }
      case "Animation":
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AnimationScreen()));
        }
      case "Register UI":
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        }
      case "Login UI":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      case "Get API":
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GetApiCallScreen()));
        }
      case "Checkbox":
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckboxScreen()));
        }
      case "Slider":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SliderScreen()));
        }
      case "Button":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ButtonScreen()));
        }
      default:
        {}
    }
  }
}
