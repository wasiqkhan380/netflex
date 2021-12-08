import 'package:flutter/material.dart';
import 'package:netflix/views/screens/detail_screen.dart';

import '../utils/text.dart';

class PopularScreen extends StatelessWidget {
  final List trending;
  const PopularScreen({Key key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(
          text: 'Trending Movies ❤ ',
          color: Colors.white,
          size: 26,
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 2,
          child: SizedBox(
              height: 270,
              child: FutureBuilder(builder:
                  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (trending.isNotEmpty) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1.5 / 2,
                        crossAxisSpacing: 2.5,
                        mainAxisSpacing: 2.5,
                      ),
                      itemCount: trending.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  name: trending[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launch_on: trending[index]['release_date']
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 140,
                                // color:Colors.yellow,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'],
                                    ))),
                              ),
                              ModifiedText(
                                color: Colors.white,
                                text: trending[index]['title'] ?? 'Loading...',
                              )
                            ],
                          ),
                        );
                      });
                }
                return const Center(child: CircularProgressIndicator());
              })),
        )
      ],
    );
  }
}
