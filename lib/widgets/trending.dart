import 'package:flutter/material.dart';
import 'package:netflix/views/screens/detail_screen.dart';

import '../utils/text.dart';

class TrendingTv extends StatelessWidget {
  final List tv;
  const TrendingTv({
    Key key,
    this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(
          color: Colors.white,
          text: 'Tv Movies ❤ ',
          size: 26,
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 200,
            child: FutureBuilder(builder:
                (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (tv.isNotEmpty) {
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1.5 / 2,
                      crossAxisSpacing: 2.5,
                      mainAxisSpacing: 2.5,
                    ),
                    itemCount: tv.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                name: tv[index]['name'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                description: tv[index]['overview'],
                                vote: tv[index]['vote_average'].toString()
                                // .toString(),
                                ,
                                launch_on: tv[index]['first_air_date'].toString(),
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
                                            tv[index]['poster_path'],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            ModifiedText(
                              color: Colors.white,
                              text: tv[index]['original_name'] ?? 'Loading...',
                            )
                          ],
                        ),
                      );
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),
          ),
        )
      ],
    );
  }
}
