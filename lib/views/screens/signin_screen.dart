
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/views/screens/sign_up_screen.dart';
import 'package:netflix/widgets/bottom_navigation/bottom_navigation.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  // const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   String email;
   String password;

  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.black,),
            backgroundColor:Colors.black,

            body: SingleChildScrollView(
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20,),
                      Image.asset('assets/netflix_logo.png'),

                      TextField(
                        // textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            email=value;
                          });

                          //Do something with the user input.
                        },
                        decoration:const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(width: 1,color: Colors.red),
                            ),
                            // focusedBorder: InputBorder.none,
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1,color: Colors.black)
                            ),
                            prefixIcon: Icon(Icons.person,color: Colors.white,),
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(32),


                                ),
                            ),

                            filled: true,
                            fillColor: Colors.white30,

                            hintText: 'Email',
                            hintStyle:TextStyle(color: Colors.white,)),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        // textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            password=value;
                          });
                          //Do something with the user input.
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(width: 1,color: Colors.red),
                            ),
                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                            filled: true,
                            fillColor: Colors.white30,

                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),)
                            ),
                            hintText: 'password',hintStyle:TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      InkWell (
                        onTap: () async {
                          try{
                            await _auth.signInWithEmailAndPassword(email: email, password: password);
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>const BottomNavigation(),
                                fullscreenDialog: false,
                              ),
                            );
                          } on FirebaseAuthException catch (err) {
                            if (err.code == "user-not-found"){
                              try{
                                await _auth
                                    .createUserWithEmailAndPassword(
                                    email: email, password: password)
                                    .then((user) {
                                  user.user.sendEmailVerification();


                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const BottomNavigation(),
                                      fullscreenDialog: false,
                                    ),
                                  );
                                });
                              } catch(err) {
                                err;
                              }
                            } else{
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text("plz correct error"),
                                  actions: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },child: const Text("ok!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),),
                                  ],
                                );
                              });
                            }
                          }
                        },
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text(
                                "Login",style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.bold),
                              ),
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.red
                                // gradient: LinearGradient(
                                //     colors: [
                                //       Color(0xFF73A0F4),
                                //       Color(0xFF4A47F5),
                                //     ]
                                // ),
                              ),
                              height: 50.0,
                              width:MediaQuery.of(context).size.width *0.85,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Forget Password?",style: TextStyle(color: Colors.white70,fontSize:15),),
                          Text("I have a problem?",style: TextStyle(color: Colors.white70,fontSize: 15),),
                        ],
                      ),
                      SizedBox(
                          height:MediaQuery.of(context).size.height*0.1
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(const SignupScreen());
                            },
                            child: const Text("Sign Up",
                              style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),),
                          ),
                          const Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                        ],
                      ),
                      Divider(thickness: 3,height:10,color: Colors.white,
                        endIndent: MediaQuery.of(context).size.width*0.5,
                      )
                      // ElevatedButton(onPressed: (){},
                      //     child: Text("Loin with facebook ")
                      // ),
                      // ElevatedButton(onPressed: (){},
                      //     child: Text("Loin with google ")
                      // ),
                      // ElevatedButton(
                      //     onPressed: (){
                      //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      // },
                      //     child: Text("Signup Screen ")
                      // ),
                    ]
                ),
              ),
            )
        ),
      ),
    );
  }
}
