import 'package:flutter/material.dart';
import 'package:netflix/widgets/appbar.dart';
import 'package:netflix/widgets/popular_screen.dart';
import 'package:netflix/widgets/drawer/custom_drawer.dart';
import 'package:tmdb_api/tmdb_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List trendingMovies=[];


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

    Map trendingResult = await  tmdbwithcustomlog.v3.trending.getTrending();
    // print(trendingResult);
    setState(() {
      trendingMovies = trendingResult['results'];
    });
    print(trendingMovies);
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
      PopularScreen(
        trending: trendingMovies
      ),



    );
  }
}
