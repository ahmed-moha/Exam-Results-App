import 'dart:convert';
import 'dart:developer';

import 'package:exam_result/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/user_model.dart';

class LoginController extends GetxController {
  bool isObscure = true;
  bool isLoading = false;
  final box = GetStorage();
  UserModel user = UserModel();
  final username = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool get hasData => box.hasData(kUserInfo);
  LoginController() {
    getUser();
  }
  changeObscureText() {
    isObscure = !isObscure;
    update();
  }

  login({Function? success}) async {
    if (loginFormKey.currentState!.validate()) {
      try {
        isLoading = true;
        update();
        var data = {
          "action": "login",
          "username": username.text,
          "password": password.text
        };
        print('THE JSON DATA: $data');
        var response = await http.post(
          Uri.parse(kEndpoint),
          body: data,
          //headers: {"Content-Type":"application/json"}
        );
        if (response.statusCode == 200) {
          print('THE RESPONSE: ${response.body},    ${response.statusCode}');
          final decodedData = jsonDecode(response.body);
          if (!decodedData['status']) throw decodedData['message'];
          user = UserModel.fromJson(decodedData['message']);
          await saveUser(user);
          success!();
          update();
        } else {
          throw response.body;
        }
      } catch (e) {
        log('$e', name: 'Login Error');
      }
      isLoading = false;
      update();
    }
  }

  saveUser(UserModel user) {
    box.remove(kUserInfo);
    box.write(kUserInfo, user.toJson());
    update();
  }

  logout(BuildContext context) {
    box.remove(kUserInfo);
    update();
    Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ));
  }

  getUser() {
    print('CALLED');
    try {
      bool hasData = box.hasData(kUserInfo);
      if (hasData) {
        final json = box.read(kUserInfo);
        if (json != null) {
          user = UserModel.fromJson(json);
          update();
        }
      }
    } catch (e) {
      print('GET USER ERROR: $e');
    }
  }
}
