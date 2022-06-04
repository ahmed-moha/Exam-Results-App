import 'package:exam_result/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_textfeild.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (cont) {
        return ModalProgressHUD(
          inAsyncCall: cont.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Register',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.registerFomrKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: const Text(
                        'Please enter your name and address , phone , and password to register :)',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name required';
                        }
                        return null;
                      },
                      hint: 'Name',
                      controller: controller.name,
                      prefixIcon: IconlyLight.profile,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address required';
                        }
                        return null;
                      },
                      hint: 'Address',
                      controller: controller.address,
                      prefixIcon: IconlyLight.location,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone required';
                        }
                        return null;
                      },
                      hint: 'Phone',
                      controller: controller.phone,
                      prefixIcon: IconlyLight.call,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password required';
                        }
                        return null;
                      },
                      hint: 'Password',
                      controller: controller.password,
                      prefixIcon: IconlyLight.location,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            primary: kPrimaryColor),
                        onPressed: () => controller.register(context),
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
