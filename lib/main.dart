import 'package:exam_result/constants.dart';
import 'package:exam_result/views/home.dart';
import 'package:exam_result/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  final box=GetStorage();

  bool hasData=box.hasData(kUserInfo);
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home:hasData? HomeView():LoginView(),
    ),
  );
}
