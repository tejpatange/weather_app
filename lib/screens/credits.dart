import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2C67F2),),
      backgroundColor: const Color(0xFF2C67F2),
      body: Container (decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF2C67F2), Color(0xFF62CFF4)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: const Center(child: Column(children: [Text("CREDITS"), Text("AppIcon made by"), Text("iconixar"), Text("from"), Text("www.flaticon.com"), Text(" "), Text("Cloud animations made by"), Text("jochang"), Text("from"), Text("www.lottieflies.com")],),),

      ));
  }
}