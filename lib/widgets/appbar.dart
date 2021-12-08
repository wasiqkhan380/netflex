import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key key,onPressed}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black,),
      backgroundColor: Colors.white,
      elevation: 3.0,
      title: const Image(
        image: AssetImage('assets/netflix_logo.png'),
      ),
      actions: <Widget>[
        IconButton(
          padding: const EdgeInsets.only(right: 30.0),
          onPressed: onPressed,
          icon: const Icon(Icons.search),
          iconSize: 30.0,
          color: Colors.black,
        ),
      ],
    );
  }
}