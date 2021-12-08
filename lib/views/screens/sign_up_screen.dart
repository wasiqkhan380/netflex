import 'dart:ui';
import 'package:flutter/material.dart';
 String  email;
String  password;


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {


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
                      Image.asset('assets/netflix_logo.png'),


                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFieldWidget(
                        hinText: 'username', icon:Icons.person,

                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFieldWidget(hinText: 'Email', icon: Icons.email,),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFieldWidget(hinText: 'password', icon:Icons.lock),
                      const SizedBox(
                        height: 8.0,
                      ),

                      TextFieldWidget(hinText: 'confirm password', icon:Icons.lock),
                      // TextField(
                      //   // textAlign: TextAlign.center,
                      //   style: TextStyle(color: Colors.white),
                      //   obscureText: true,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       password=value;
                      //     });
                      //     //Do something with the user input.
                      //   },
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.lock,color: Colors.white,),
                      //       filled: true,
                      //       fillColor: Colors.white30,
                      //
                      //       border: OutlineInputBorder(
                      //
                      //           borderRadius: BorderRadius.all(Radius.circular(32),)
                      //       ),
                      //       hintText: 'password',hintStyle:TextStyle(color: Colors.white)),
                      // ),
                      // TextField(
                      //   // textAlign: TextAlign.center,
                      //   style: TextStyle(color: Colors.white),
                      //   obscureText: true,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       password=value;
                      //     });
                      //     //Do something with the user input.
                      //   },
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.lock,color: Colors.white,),
                      //       filled: true,
                      //       fillColor: Colors.white30,
                      //
                      //       border: OutlineInputBorder(
                      //
                      //           borderRadius: BorderRadius.all(Radius.circular(32),)
                      //       ),
                      //       hintText: 'password',hintStyle:TextStyle(color: Colors.white)),
                      // ),
                      // TextField(
                      //   // textAlign: TextAlign.center,
                      //   style: TextStyle(color: Colors.white),
                      //   obscureText: true,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       password=value;
                      //     });
                      //     //Do something with the user input.
                      //   },
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.lock,color: Colors.white,),
                      //       filled: true,
                      //       fillColor: Colors.white30,
                      //
                      //       border: OutlineInputBorder(
                      //
                      //           borderRadius: BorderRadius.all(Radius.circular(32),)
                      //       ),
                      //       hintText: 'password',hintStyle:TextStyle(color: Colors.white)),
                      // ),
                      const SizedBox(
                        height: 24.0,
                      ),
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
                      const SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Forget Password?",style: TextStyle(color: Colors.white70,fontSize:15),),
                          Text("I have a problem?",style: TextStyle(color: Colors.white70,fontSize: 15),),
                        ],
                      ),
                      SizedBox(
                          height:MediaQuery.of(context).size.height*0.05
                      ),
                      const Text("Or",
                        style: TextStyle(
                            decorationThickness: 2,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize:30,
                            fontWeight: FontWeight.bold
                        ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.13,
                            child:const Text(' f ',style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                              textAlign: TextAlign.center,),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.lightBlue,
                                width: 3.0 ,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.14,
                            child:
                            const Icon(Icons.email,color: Colors.deepOrange,),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3.0 ,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
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
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({Key key,  this.hinText,this.icon,}) : super(key: key);
 final String hinText;
  IconData icon;
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      // textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          email=value;
        });

        //Do something with the user input.
      },
      decoration:InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: Colors.white,),
          border:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))
          ),

          filled: true,
          fillColor: Colors.white30,

          hintText:widget.hinText,
          hintStyle:const TextStyle(color: Colors.white,)),
    );
  }
}
