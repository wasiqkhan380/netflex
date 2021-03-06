import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constaints.dart';
final _fireStore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser()async{
    try {
      final user =  _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream()async{
    await for (var snapshot in _fireStore.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.data() );
      }
    }
  }
  // void  getMessages()async{
  //   await for (var snapshot in _firestore.collection('messages').snapshots())
  //     for (var message in snapshot.docs){
  //      print(message.data());
  //    }
  //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Implement logout functionality
              }),
          // IconButton(
          //     icon: const Icon(Icons.get_app),
          //     onPressed: () {
          //       messageStream();
          //       //Implement logout functionality
          //     }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: messageController,
                      onChanged: (value) {
                        messageText=value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageController.clear();
                      _fireStore.collection('messages').add({
                        "message":messageText,
                        "sender":loggedInUser.email,
                      "timestamp":
                      DateTime.now().toUtc().millisecondsSinceEpoch,
                      });

                      //Implement send functionality.
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton:   FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen()));
      //   },
      //   child: Icon(Icons.thumb_up),
      //   backgroundColor: Colors.pink,
      // ),
    );
  }
}
class MessagesStream extends StatelessWidget {
  const MessagesStream({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return      StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection("messages").orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            print(snapshot.data);
            return const Center(child: CircularProgressIndicator());
          }else {
            // print("wasqimfbndrkgnk,jhg");
          }
          final messages = snapshot.data.docs;
          List<MessageBubble> messageWidgets = [];
          for (var message in messages) {

            final messageSender = message['sender'];
            final messageText = message['message'];
            final currentUser = loggedInUser?.email;


            if(currentUser==messageSender){


            }


            final messageBubble = MessageBubble(
              sender: messageSender.toString(),
              text: messageText.toString(),
              isMe: currentUser==messageSender,);
            messageWidgets.add(messageBubble);
          }
          return Expanded(
            child:  ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children: messageWidgets,
            ),
          );}
          // return Text("f");
        );
  }
}




class MessageBubble extends StatelessWidget {
   const MessageBubble({Key key,  this.text,  this.sender , this.isMe }) : super(key: key) ;
  final String text;
  final String sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(sender,style: const TextStyle(fontSize: 12,color: Colors.white),),
            Material(
              elevation: 5,
              borderRadius: isMe?
              const BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  // topRight:  Radius.circular(),
              ):
              const BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5)
              ),
              color:isMe? Colors.red:Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 12,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
