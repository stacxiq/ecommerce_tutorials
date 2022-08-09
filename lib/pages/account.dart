import 'package:ecommerce_tutorials/pages/auth/login.dart';
import 'package:ecommerce_tutorials/pages/auth/register.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('الحساب'),
        ),
        body: Column(children: [
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => RegisterPage()));
            },
            isThreeLine: true,
            title: Text('تسجيل'),
            subtitle: Text('قم ب اضافة معلوماتك الخاصة لتسجيل حسابك'),
            leading: Icon(Icons.person_add),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginPage()));
            },
            isThreeLine: true,
            title: Text('تسجيل دخول'),
            subtitle:
                Text('قم ب ادخال معلوماتك الخاصة لتسجيل الددخول الى حسابك'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(),
        ]));
  }
}
