import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/chat/chat_screen.dart';

class CustomListTile extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  final IconData doHaveMoreOptions;
  final int infoCount;
  final Function() onPressed;

   CustomListTile({
    Key key,
     this.isCollapsed,
     this.onPressed,
     this.icon,
     this.title,
    this.doHaveMoreOptions,
    this.infoCount,
  }) : super(key: key);

   String email;
   String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isCollapsed ? 300 : 80,
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(onPressed: onPressed, icon:
                  Icon(
                    icon,
                    color: Colors.white,
                  ),),
                  if (infoCount > 1)
                    Positioned(
                      right: -5,
                      top: -5,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isCollapsed) const SizedBox(width: 10),
          if (isCollapsed)
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: onPressed,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.redAccent,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  if (infoCount > 1)
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.purple[200],
                        ),
                        child: Center(
                          child: Text(
                            infoCount.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          if (isCollapsed) const Spacer(),
          if (isCollapsed)
            Expanded(
              flex: 1,
              child: doHaveMoreOptions != null
                  ? IconButton(
                      icon: Icon(
                        doHaveMoreOptions,
                        color: Colors.redAccent,
                        size: 12,
                      ),
                      onPressed: () {},
                    )
                  : const Center(),
            ),
        ],
      ),
    );
  }
}
