import 'package:flutter/material.dart';
import 'package:netflix/views/screens/detail_screen.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../utils/text.dart';

class TopRatedScreen extends StatelessWidget {
  final List movies;
  const TopRatedScreen({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(
          color: Colors.white,
          text: 'Top Rated ❤ ',
          size: 26,
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 200,
            child: FutureBuilder(builder:
                (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (movies.isNotEmpty) {
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1.5 / 2,
                      crossAxisSpacing: 2.5,
                      mainAxisSpacing: 2.5,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                name: movies[index]['title'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    movies[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    movies[index]['poster_path'],
                                description: movies[index]['overview'],
                                vote: movies[index]['vote_average'].toString(),
                                launch_on:
                                    movies[index]['release_date'].toString(),
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
                                            movies[index]['poster_path'],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            ModifiedText(
                              color: Colors.white,
                              text: movies[index]['title'] ?? 'Loading...',
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
