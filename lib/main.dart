import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppies/controller/puppies_controller.dart';
import 'package:puppies/pages/my_home_page.dart';
import 'package:puppies/pages/puppies_page.dart';
import 'package:puppies/providers/dark_mode.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DarkProvider())],
      child: MyApp()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  PuppiesController puppiesCtrl = PuppiesController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puppies',
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/puppies": (context) => const PuppiesPage(),
        // PuppiesPage(allPuppies: puppiesCtrl.getAllPuppies()),
        "/home": (context) => const MyHomePage()
      },
    );
  }
}
