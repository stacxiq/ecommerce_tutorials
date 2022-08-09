import 'package:ecommerce_tutorials/models/user_request.dart';
import 'package:ecommerce_tutorials/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final nameNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final confirmNode = FocusNode();

  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('تسجيل'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  focusNode: nameNode,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'قم ب آضافة الاسم';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: inputBorder,
                    enabledBorder: inputBorder,
                    focusedBorder: inputBorder,
                    labelText: 'الاسم',
                    hintText: 'الاسم',
                    prefixIcon: const Icon(
                      Iconsax.user,
                      color: Colors.red,
                    ),
                  ),
                ),
                const Gap(15),
                TextFormField(
                  controller: emailController,
                  focusNode: emailNode,
                  validator: (v) {
                    if (!v!.contains('@')) {
                      return ' يرجوا اضافة البريد الالكتروني';
                    }
                    return null;
                  },
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
                  validator: (v) {
                    if (v!.length < 6) {
                      return 'يرجوا اضافة كلمة مرور بصيغة صحيحة';
                    }
                    return null;
                  },
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
                const Gap(15),
                TextFormField(
                  controller: confirmPasswordController,
                  focusNode: confirmNode,
                  validator: (v) {
                    if (v != passwordController.text) {
                      return 'كلمة المررور غير مطابقة';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: inputBorder,
                    enabledBorder: inputBorder,
                    focusedBorder: inputBorder,
                    labelText: ' تآكيد كلمة المرور',
                    hintText: '  تآكيد كلمة المرور',
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {}
                      //   final result = await authRepository.register(
                      //       UserRequest(
                      //           name: nameController.text,
                      //           email: emailController.text,
                      //           password: passwordController.text));

                      //   result.fold((left) {
                      //     print(left.message);
                      //   }, (right) {
                      //     print(right.data);
                      //   });
                      // }
                    },
                    child: Text('تسجيل'),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
