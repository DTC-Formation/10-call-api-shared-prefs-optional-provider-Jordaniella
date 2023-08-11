import 'package:flutter/material.dart';
import 'package:puppies/views/puppies_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _bgBlue = const Color.fromRGBO(55, 22, 65, 1);
  final Color _yellow = const Color.fromRGBO(255, 184, 80, 1);
  // final Color _primary = const Color.fromRGBO(247, 93, 94, 1);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: _bgBlue,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height - 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Text("Make a new Friend !",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    Text(
                      "Adopt a Pet today",
                      style: TextStyle(color: _yellow, fontSize: 18),
                    ),
                    ButtonPuppies(
                        icone: Icons.check_circle_outline,
                        content: "LET'S GO !",
                        isSimple: true,
                        bgColor: _yellow,
                        urlPage: "/puppies"),
                  ],
                ),
              ),
              SizedBox(
                width: size.width,
                height: 500,
                child: Image.asset(
                  "assets/images/bg.PNG",
                  fit: BoxFit.cover,
                ),
              )
            ]),
      ),
    );
  }
}
