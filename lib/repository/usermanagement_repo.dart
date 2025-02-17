import 'package:dio/dio.dart';
import 'package:troma_demo/model/user_model.dart';
import 'package:troma_demo/network/ApiHelper.dart';
import 'package:troma_demo/network/GenricClass.dart';
import 'package:troma_demo/utils/utils.dart';

class UserManagementRepo {
  var apiHelper = ApiHelper();
  var baseUrl = "https://api.escuelajs.co/api/v1/";

  Future<List<UserModel>> getUserList() async {
    try {
      List<dynamic> response = await apiHelper.getApi(url: "${baseUrl}user");
      return List<UserModel>.from(response.map((x) => UserModel.fromJson(x)));
    } catch (e) {
      print("HHH" + e.toString());
      return [];
    }
  }

  Future<Response<GenericResponse>> getCategoryList() async {
    // await apiHelper.getGeneric(url: "", isAuthRequired: true);

    return await apiHelper.getGeneric(url: "", isAuthRequired: true);
  }

  var tag = "UserManagementRepo";
  Future<UserModel> addUser(UserModel model) async {
    try {
      Map<String, dynamic> response =
          await apiHelper.postApi(url: "${baseUrl}users/", object: model);
      return UserModel.fromJson(response);
    } catch (e) {
      // print(e.toString());
      printValue("$tag [$e]");
      return UserModel();
    }
  }
}
