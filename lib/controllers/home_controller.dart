import 'dart:convert';

import 'package:exam_result/constants.dart';
import 'package:exam_result/controllers/login_controller.dart';
import 'package:exam_result/models/exam_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  bool isLoading = false;
  final user = Get.find<LoginController>();
  List<ExamModel> exams = [];
  getExam() async {
    try {
      isLoading = true;
      update();
      var data = {
        "action": "fill",
        "procedure": "get_exam_results",
        "req_id": user.user.id
      };
      var response = await http.post(Uri.parse(kEndpoint), body: data);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        if (!decodedData['status']) throw decodedData['message'];
        for (var element in decodedData['message']) {
          exams.add(ExamModel.fromJson(element));
          update();
        }
      } else {
        throw response.body;
      }
    } catch (e) {
      print(e);
    }
    isLoading=false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getExam();
  }
}
