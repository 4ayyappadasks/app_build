import 'package:flutter/material.dart';

class welcome_sc extends StatefulWidget {
  const welcome_sc({Key? key}) : super(key: key);

  @override
  State<welcome_sc> createState() => _welcome_scState();
}

class _welcome_scState extends State<welcome_sc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Container()),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text("Enter User\nDetails!"),
            Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/images/img.png")),
                  shape: BoxShape.circle),
              child: Icon(Icons.camera_alt),
            ),
            Container(child: TextField(decoration: InputDecoration(hintText: "Name"),)),
            Container(child: TextField(decoration: InputDecoration(hintText: "Age"),)),
            ElevatedButton(onPressed: () {}, child: Text("save")),
        ],
      ),
          )),
    );
  }
}
