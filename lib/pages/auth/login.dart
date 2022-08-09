import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.red));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(' تسجيل دخول'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailNode,
              decoration: InputDecoration(
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                labelText: 'البريد الالكتروني',
                hintText: 'البريد الالكتروني',
                prefixIcon: const Icon(
                  Iconsax.message,
                  color: Colors.red,
                ),
              ),
            ),
            const Gap(15),
            TextFormField(
              controller: passwordController,
              focusNode: passwordNode,
              decoration: InputDecoration(
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                labelText: ' كلمة المرور',
                hintText: ' كلمة المرور',
                prefixIcon: const Icon(
                  Iconsax.password_check,
                  color: Colors.red,
                ),
              ),
            ),
            const Gap(20),
            LayoutBuilder(builder: (context, constraint) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: Size(constraint.constrainWidth(), 45)),
                onPressed: () {},
                child: Text('تسجيل'),
              );
            })
          ],
        ),
      ),
    );
  }
}
