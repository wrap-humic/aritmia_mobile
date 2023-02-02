import 'package:aritmia_mobile/main.dart';
import 'package:aritmia_mobile/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  Future<void> _initData() async {
    UserProvider provider = context.read<UserProvider>();
    await provider.init();
    String? email = provider.user?.data.email;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (email == null) {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, MyHomePage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }
}
