import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:troma_demo/AppContant/app_images.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.imgGlob,
                  height: 100,
                  width: 100,
                ),
                Image.network(
                  "https://fastly.picsum.photos/id/4/5000/3333.jpg?hmac=ghf06FdmgiD0-G4c9DdNM8RnBIN7BO0-ZGEw47khHP4",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SvgPicture.asset(
                  AppIcon.icDuck,
                  height: 50,
                  width: 50,
                ),
                Lottie.asset(AppLottie.animLoading, height: 100, width: 200)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
