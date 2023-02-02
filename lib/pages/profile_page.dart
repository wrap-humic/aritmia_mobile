import 'dart:convert';

import 'package:aritmia_mobile/common/constant.dart';
import 'package:aritmia_mobile/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_response.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = "";
  String namaLengkap = "";

  UserResponse? user;

  Future<void> _initiateData() async {
    //get data user from shared preferences
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString(userPref) != null) {
      Map<String, dynamic> userMap =
          jsonDecode(preferences.getString(userPref)!);
      user = UserResponse.fromJson(userMap);
    }

    setState(() {
      email = user?.data.email ?? "";
      namaLengkap = user?.data.namaLengkap ?? "";
    });
  }

  Future<void> _signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (Route<dynamic> route) => false);
    });
  }

  _confirmLogout() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure want to logout?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                _signOut();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _initiateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_profile.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/icon_mobile.png',
                      width: 152.0,
                      height: 152.0,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/nurse.png',
                          width: 100.0,
                          height: 100.0,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          namaLengkap,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          email,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _confirmLogout();
                          },
                          child: const Text(
                            'Logout',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
