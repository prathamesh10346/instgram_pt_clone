import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgram_pt_clone/resources/auth_method.dart';
import 'package:instgram_pt_clone/screen/login_screen.dart';
import 'package:instgram_pt_clone/utils/util.dart';

import '../Widgets/text_field_input.dart';
import '../utils/color.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _paswordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImages() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void NavigatorTologin() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );

    void signUpUser() async {
      setState(() {
        _isloading = true;
      });

      String res = await AuthMethods().singUpUser(
        email: _emailController.text,
        password: _paswordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!,
      );
      print(res);
      setState(() {
        _isloading = false;
      });
      if (res != 'success') {
        ShowSnackBar(context, res);
      } else
        () {};

      print(res);
    }

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
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/736x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg"),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImages,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: "Enter your Username",
                  textInputType: TextInputType.text,
                  // isPass: true,
                ),
                const SizedBox(
                  height: 24,
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
                TextFieldInput(
                  textEditingController: _bioController,
                  hintText: "Enter your Bio",
                  textInputType: TextInputType.text,
                  // isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: signUpUser,
                  child: Container(
                    child: _isloading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : const Text("Sign-in"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                      onTap: NavigatorTologin,
                      child: Container(
                        child: Text(
                          "login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
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
