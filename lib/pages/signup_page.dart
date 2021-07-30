import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  static final String id="signup_page";
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var fullnameController=TextEditingController();
  var cpasswordController=TextEditingController();

  _callSignInPage(){
    Navigator.pushReplacementNamed(context,SignInPage.id );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(252, 175, 69, 1),
                  Color.fromARGB(245, 96, 64, 1),

                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end
          ,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Instagram",style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: "Billabong"),),
                  SizedBox(height: 20,),

                  //#fullname
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:TextField(
                      controller: fullnameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Fullname",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17.0,color: Colors.white54),
                      ),
                    ) ,
                  ),
                  SizedBox(height: 10,),


                  //#email
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17.0,color: Colors.white54),
                      ),
                    ) ,
                  ),
                  SizedBox(height: 10,),

                  //#password
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17.0,color: Colors.white54),
                      ),
                    ) ,
                  ),
                  SizedBox(height: 10,),

                  //#Confirm password
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:TextField(
                      controller: cpasswordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17.0,color: Colors.white54),
                      ),
                    ) ,
                  ),
                  SizedBox(height: 10,),
                  //#sign up
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white54.withOpacity(0.2),width: 2
                          ),
                          borderRadius: BorderRadius.circular(7)
                      ),

                      child:Center(
                        child:  Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 17),),
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.white,fontSize: 17),),
                  SizedBox(width: 10,),

                  GestureDetector(
                    onTap:_callSignInPage,

                    child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
