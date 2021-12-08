import 'package:flutter/material.dart';
import 'package:netflix/widgets/appbar.dart';
import 'package:netflix/widgets/drawer/custom_drawer.dart';
import 'package:netflix/widgets/popular_screen.dart';
import 'package:netflix/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TrendingScreen extends StatefulWidget {

  const TrendingScreen({Key key, }) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {


  List tvTrending=[];

  final  String  apiKey='b1ca3e466a5d1fa7a6c65e4e931e93a1';
  final readAccessToken ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMWNhM2U0NjZhNWQxZmE3YTZjNjVlNGU5MzFlOTNhMSIsInN1YiI6IjYxOGI2MDM3NjlkMjgwMDA2NmU0OGFkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G48ObxyHGgKulr2z1sUS9baM54IHdz03RiC_lp8Inlo';

  @override
  void initState(){
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbwithcustomlog =TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs:true,
        ));

    Map tvResult = await  tmdbwithcustomlog.v3.tv.getTopRated();
    // print(trendingResult);
    setState(() {
      tvTrending = tvResult['results'];
    });
    print(tvTrending);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(
          onPressed: (){
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body:
      TrendingTv(tv: tvTrending,)
    );
  }
}
