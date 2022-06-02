import 'dart:convert';

import 'package:exam_result/constants.dart';
import 'package:exam_result/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final box = GetStorage();
  bool isLoading = false;
  UserModel user = UserModel();
  final registerFomrKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  RegisterController() {
    getUser();
  }

  register() async {
    if (registerFomrKey.currentState!.validate()) {
      try {
        isLoading = true;
        update();
        user = await reg();
        print('USER NAME IS : ${user.name}');
      } catch (e) {
        print('THE ERROR $e');
      }
      isLoading = false;
      update();
    }
  }

  reg() async {
    var data = {
      "action": "register",
      "student_phone": phone.text,
      "student_name": name.text,
      "password": password.text,
      "student_address": address.text
    };
    var response = await http.post(Uri.parse(kEndpoint), body: data);
    if (response.statusCode == 200) {
      print(response.body);
      final decodedData = jsonDecode(response.body);
      if (!decodedData['status']) throw decodedData;
      await saveUser(UserModel.fromJson(decodedData['message']));
      return UserModel.fromJson(decodedData['message']);
    } else {
      throw response.body;
    }
  }

  saveUser(UserModel user) {
    box.remove(kUserInfo);
    box.write(kUserInfo, user);
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
