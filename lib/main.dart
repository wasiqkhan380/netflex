import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:netflix/views/screens/signin_screen.dart';
import 'package:netflix/widgets/bottom_navigation/bottom_navigation.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Stripe.publishableKey="pk_test_51K12L3LCs4rq10aIpIx5QDeAbnWU10mxlwnHxA7kV6w1JXph5t92KxlXA3bqvvUgvOZ9fFdvDDZ2B8F4NB1xRKjP00mrEm2icR";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:  FutureBuilder(
            // Initialize FlutterFire
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              // Check for errors
              if (snapshot.hasError) {
                return const Text("there is Bala or baoo");
              }

              // Once complete, show your application
              if (snapshot.connectionState == ConnectionState.done) {
                return const LoginScreen();
              }

              // Otherwise, show something whilst waiting for initialization to complete
              return const CircularProgressIndicator();
            },
          ),
        )
    );
  }
}
