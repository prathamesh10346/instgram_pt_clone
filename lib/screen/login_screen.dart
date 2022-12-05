import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instgram_pt_clone/Widgets/text_field_input.dart';
import 'package:instgram_pt_clone/resources/auth_method.dart';
import 'package:instgram_pt_clone/screen/Home_sreen.dart';
import 'package:instgram_pt_clone/screen/singup_screen.dart';
import 'package:instgram_pt_clone/utils/color.dart';

import '../utils/util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _paswordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _paswordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ShowSnackBar(context, res);
    }
    setState(() {
      _isLoading = true;
    });
  }

  void NavigatorTosignup() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SingupScreen()),
    );

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                SvgPicture.asset(
                  "assets/ic_instagram.svg",
                  bundle: null,
                  // cacheColorFilter: null,
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(
                  height: 64,
                ),
                TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                  // isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _paswordController,
                  hintText: "Enter your password",
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: loginUser,
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          child: const Text("LogIn"),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              color: blueColor),
                          // color: blueColor/
                        ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Don`t have an account? "),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: NavigatorTosignup,
                      child: Container(
                        child: Text(
                          "Sing Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
