import 'package:app_build/firebase_st/authintication/helper/helper_class.dart';
import 'package:app_build/firebase_st/screens/welcome_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp( MaterialApp(home: user == null ?welcome_sc():signin(),));
}

class signin extends StatefulWidget {


  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {

  TextEditingController sigin_usr = TextEditingController();
  TextEditingController sigin_psd = TextEditingController();
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 240, top: 30),
                child: Text("Hello!\nWelcome back",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[900])),
              ),
              SizedBox(height: 50),

              ///text field 1 in container
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(width: (MediaQuery.of(context).size.width/1.33),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        )
                      ], borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: TextField(controller: sigin_usr,
                      style: TextField.materialMisspelledTextStyle,
                      decoration: InputDecoration(
                          hintText: "Email", border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              ///textfield 2 in container
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(width: (MediaQuery.of(context).size.width/1.33),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        )
                      ], borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: TextField(controller: sigin_psd,
                      obscureText: show,
                      style: TextField.materialMisspelledTextStyle,
                      decoration: InputDecoration(

                          suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if(show)
                                {
                                  show=false;
                                }
                              else
                                {
                                  show=true;
                                }
                            });
                          },
                          icon: Icon(show == true ? Icons.visibility_off:Icons.visibility)),
                          hintText: "Password", border: InputBorder.none),
                    ),
                  ),
                ),
              ),

              ///forgot text button
              Padding(
                padding: const EdgeInsets.only(left: 250),
                child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.cyan[900]))),
              ),
              SizedBox(height: 15),

              ///sign in button
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.cyan[900]),
                      minimumSize: MaterialStatePropertyAll(Size(
                          (MediaQuery
                              .of(context)
                              .size
                              .width / 1.5),
                          (MediaQuery
                              .of(context)
                              .size
                              .height / 12))),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    String name = sigin_usr.text.trim();
                    String pas = sigin_psd.text.trim();
                     helper().SignIn(email: name, password: pas).then((value)
                     {
                     if(value==null)
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => welcome_sc(),));
                      }
                     else
                       {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error is ${value}")));
                       }
                      });
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(height: 20),

              ///text and textbutton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "2");
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[900]),
                      ))
                ],
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
    );
  }
}
