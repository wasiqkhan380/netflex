import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/utils/text.dart';
import 'package:netflix/views/payment_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constaints.dart';

class DetailScreen extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const DetailScreen(
      {Key key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children: [
          SizedBox(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: '⭐ Average Rating - ' + vote,
                      color: Colors.white,
                      size: 18,
                    )),
              ])),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                  text: name ?? 'Not Loaded', color: Colors.white, size: 24)),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ModifiedText(
                      text: 'Releasing On - ' + launch_on,
                      color: Colors.white,
                      size: 14)),
              const Spacer(),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: (){
                      Get.defaultDialog(
                          backgroundColor: Colors.black,
                          title: "Purchase",titleStyle:const TextStyle(color: Colors.white),
                          content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.red),
                                onPressed: () async{
                              final url = '$youtubeSearch$name+offical+trailer'.toLowerCase();
                              if (await canLaunch(url)) {
                              await launch(url);
                              } else {
                              throw 'Could not launch $url';
                              }
                            }, child: const Text("Trial")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.red),
                                onPressed: (){
                              Get.to(const PaymentScreen());
                            }, child: const Text("Purchase")),
                          ],
                        )
                      );
                    },
                    child: const FittedBox(
                      child: ModifiedText(
                        text:"Watch Movie",
                      ),
                    )),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 300,
                  width: 100,
                  child: Image.network(
                    posterurl,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ModifiedText(
                    textOverflow: TextOverflow.visible,
                    text: description,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
