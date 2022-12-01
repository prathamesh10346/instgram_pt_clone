import 'package:flutter/material.dart';

import 'package:instgram_pt_clone/responsive/mob_screen_layout.dart';
import 'package:instgram_pt_clone/responsive/responsive_layout_screen.dart';
import 'package:instgram_pt_clone/responsive/web_screen_layout.dart';
import 'package:instgram_pt_clone/utils/color.dart';

void main() {
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
        home: const ResponsiveLayout(
          mobileScreenLayout: mobileScreenLayout(),
          webScreenLayout: webScreenLayout(),
        ));
  }
}
