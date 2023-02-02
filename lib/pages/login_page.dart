import 'package:aritmia_mobile/main.dart';
import 'package:aritmia_mobile/models/user_response.dart';
import 'package:aritmia_mobile/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> login(BuildContext context) async {
    setState(() {
      _isLoading = false;
    });

    UserProvider provider = context.read<UserProvider>();

    UserResponse response = await provider.login(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    );

    if (response.statusCode == 200) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, MyHomePage.routeName, (Route<dynamic> route) => false);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
          ),
        );
      });
    }
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_auth.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xFFfafafa),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(37, 0, 0, 0),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(
                        2.2,
                        2.2,
                      ), // shadow direction: bottom right
                    )
                  ],
                ),
                margin: const EdgeInsets.only(
                  bottom: 8.0,
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                ),
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16.0,
                        ),
                        Image.asset(
                          'assets/images/icon_mobile.png',
                          height: 80,
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Fill this field';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: "Masukkan E-mail"),
                          controller: _controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Fill this field';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Masukkan Password",
                          ),
                          controller: _controllerPassword,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text('Sign in'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        _isLoading
                            ? const SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
