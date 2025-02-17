import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troma_demo/widget/app_font.dart';

import '../../model/user_model.dart';
import '../../provider/usermanagement_provider.dart';

class GetApiCallScreen extends StatefulWidget {
  const GetApiCallScreen({super.key});

  @override
  State<GetApiCallScreen> createState() => _GetApiCallScreenState();
}

class _GetApiCallScreenState extends State<GetApiCallScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<UserManagementProvider>().getUserList();
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Get Api demo",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<UserManagementProvider>(
                  builder: (context, provider, child) {
                return ListView.builder(
                    itemCount: provider.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          provider.userList[index].name.toString(),
                          style: TextStyle(
                              fontFamily: AppFont.fontVioletSens,
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    });
              }),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserManagementProvider>().addUser(UserModel(
                        name: "PKKK",
                        email: "pk@gmail.com",
                        password: "1234",
                        avatar: "https://picsum.photos/800",
                      ));
                },
                child: Text("Add User"))
          ],
        ));
  }
}
