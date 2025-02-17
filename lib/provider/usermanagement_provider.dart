import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:troma_demo/model/user_model.dart';
import 'package:troma_demo/repository/usermanagement_repo.dart';

class UserManagementProvider extends ChangeNotifier {
  late UserManagementRepo repo;

  UserManagementProvider.init() {
    repo = UserManagementRepo();
  }

  List<UserModel> _userList = [];

  List<UserModel> get userList => _userList;

  getUserList() async {
    var data = repo.getUserList();
    data.then((response) {
      _userList = response!;
      notifyListeners();
    });
  }

  addUser(UserModel model) {
    var data = repo.addUser(model);
    data.then((onValue) {
      getUserList();
      notifyListeners();
    });
  }
}
