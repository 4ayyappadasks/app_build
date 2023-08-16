import 'package:app_build/firebase_st/authintication/helper/helper_class.dart';
import 'package:app_build/firebase_st/screens/sign_in.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController sigup_usr =TextEditingController();
  TextEditingController sigup_psd =TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 240, top: 30),
                  child: Text("Signup to\nGet Started",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[900])),
                ),
                SizedBox(height: 50),

                ///text field 1 in container
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(width: (MediaQuery
                      .of(context)
                      .size
                      .width / 1.33),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: TextFormField(controller: sigup_usr,
                        style: TextField.materialMisspelledTextStyle,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none),),),),),
                SizedBox(height: 10),

                ///textfield 2 in container
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(width: (MediaQuery
                      .of(context)
                      .size
                      .width / 1.33),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: TextField(controller:sigup_psd,
                        obscureText: show,
                        style: TextField.materialMisspelledTextStyle,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (show) {
                                      show = false;
                                    } else {
                                      show = true;
                                    }
                                  });
                                },
                                icon: Icon(show == true
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            hintText: "Password",
                            border: InputBorder.none),),),),),

                SizedBox(height: 40,),

                ///sign up button
                ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(
                            (MediaQuery
                                .of(context)
                                .size
                                .width / 1.5),
                            (MediaQuery
                                .of(context)
                                .size
                                .height / 14.5))),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)))),
                    onPressed: ()
                    {
                      String sname = sigup_usr.text.trim();
                      String spas =  sigup_psd.text.trim();
                      helper().SignUP(email: sname, password: spas).then((value)
                      {
                        if(value==null)
                          {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => signin(),));
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error is ${value}")));
                          }
                      });
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 18),
                    )),

                ///text and textbutton
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 125),
                  child: Row(
                    children: [
                      Text("Already have an account",
                          style: TextStyle(color: Colors.grey)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "1");
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan[900]),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 10),

                ///line ccontainer
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid)),
                  ),
                ),
                SizedBox(height: 20),

                ///google Authentication and phone OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                          width: 50,
                          height: 50,
                          "assets/images/google-logo-9808.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "4");
                      },
                      child: Image.asset(
                          width: 50,
                          height: 50,
                          "assets/images/smartphone-12089.png"),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
