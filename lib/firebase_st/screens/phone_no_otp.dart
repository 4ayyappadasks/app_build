import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phone__otp extends StatefulWidget {
  const phone__otp({Key? key}) : super(key: key);

  @override
  State<phone__otp> createState() => _phone__otpState();
}

class _phone__otpState extends State<phone__otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: (MediaQuery.of(context).size.width / 1.20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Enter Your Phone Number",
                      hintStyle: TextStyle(color: Colors.cyan[200]),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5, top: 15),
                        child: Text("+${91}"),
                      )),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.cyan[900]),
                  minimumSize: MaterialStatePropertyAll(Size(100, 40)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
              onPressed: () {},
              child: Text("Get otp"))
        ]),
      ),
    );
  }
}
