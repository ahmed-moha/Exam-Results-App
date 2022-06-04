import 'package:exam_result/constants.dart';
import 'package:exam_result/controllers/home_controller.dart';
import 'package:exam_result/controllers/login_controller.dart';
import 'package:exam_result/widgets/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final login = Get.put(LoginController());
  final controlelr = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<LoginController>(builder: (cont) {
            return IconButton(
              onPressed: () => cont.logout(context),
              icon: const Icon(
                IconlyBold.logout,
                color: kPrimaryColor,
              ),
            );
          })
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Exam Veiwer',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<LoginController>(builder: (cont) {
                    if (cont.hasData) {
                      return Container(
                        margin: const EdgeInsets.only(left: 12, top: 12),
                        child: Text(
                          'hi, ${cont.user.name ?? ""}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(left: 12, top: 12),
                        child: const Text(
                          'hi,',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }
                  }),
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 12),
                    child: const Text(
                      'Let\'t see results',
                    ),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: kPrimaryColor),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(10, 0),
                          blurRadius: 12,
                          color: Colors.grey.shade100,
                        ),
                        BoxShadow(
                          offset: const Offset(10, 0),
                          blurRadius: 12,
                          color: Colors.grey.shade200,
                        )
                      ]),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/j.png'),
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: GetBuilder<HomeController>(builder: (cont) {
              if (cont.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (cont.exams.isEmpty) {
                return const Center(
                  child: Text('NO EXAMS FOUND'),
                );
              } else {
                return ListView.builder(
                  itemCount: cont.exams.length,
                  itemBuilder: (context, index) =>
                      ExamCard(exam: cont.exams[index]),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
