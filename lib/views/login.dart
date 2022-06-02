import 'package:exam_result/constants.dart';
import 'package:exam_result/controllers/login_controller.dart';
import 'package:exam_result/views/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_textfeild.dart';
import 'home.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (login) {
      return ModalProgressHUD(
        inAsyncCall: login.isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Login',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: const Text(
                      'Please enter your Username and Password to login :)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username required';
                      }
                      return null;
                    },
                    controller: controller.username,
                    prefixIcon: IconlyLight.profile,
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
                    controller: controller.password,
                    prefixIcon: IconlyLight.lock,
                    isObscureText: controller.isObscure,
                    hint: 'Password',
                    sufixIcon: IconButton(
                      icon: Icon(
                        controller.isObscure == true
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        size: 18,
                      ),
                      onPressed: () => controller.changeObscureText(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: kSecondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
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
                      onPressed: () => controller.login(success: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  HomeView(),
                            ));
                      }),
                      child: const Text('Login'),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account',
                style: TextStyle(color: kSecondaryColor),
              ),
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
              }, child: const Text('Sign up'))
            ],
          ),
        ),
      );
    });
  }
}
