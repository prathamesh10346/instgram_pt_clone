import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:instgram_pt_clone/responsive/mob_screen_layout.dart';
import 'package:instgram_pt_clone/responsive/responsive_layout_screen.dart';
import 'package:instgram_pt_clone/responsive/web_screen_layout.dart';
import 'package:instgram_pt_clone/screen/login_screen.dart';
import 'package:instgram_pt_clone/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCiLhp0h2L7Lz5iXxMImTmOwNvzrqaI3lg",
            appId: "1:151256580726:web:5278bd0a580f0637f55557",
            messagingSenderId: "151256580726",
            projectId: "instagram-clone-f2fd2",
            storageBucket: "instagram-clone-f2fd2.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Hello prathamesh open project

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram_clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: mobileScreenLayout(),
      //   webScreenLayout: webScreenLayout(),
      // ));
      home: LoginScreen(),
    );
  }
}
