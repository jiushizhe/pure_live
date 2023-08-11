
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live/routes/app_pages.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'dart:developer';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SupaEmailAuth(
              redirectTo: null,
              onSignInComplete: (AuthResponse response) {
                Get.rawSnackbar(message: '登陆成功');
                Get.toNamed(AppPages.initial);
                log(response.user.toString());
              },
              onSignUpComplete: (AuthResponse response) {
                Get.rawSnackbar(message: '登陆失败');
              },
            ),
          ],
        ),
      ),
    );
  }
}
