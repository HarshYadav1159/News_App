import 'package:flutter/material.dart';
import 'package:movies/providers/movies.dart';
import 'package:movies/screen/NDTV.dart';
import 'package:movies/screen/NDTVlatest.dart';
import 'package:movies/screen/home_screen.dart';
import 'package:movies/screen/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
        ChangeNotifierProvider.value(
        value: MovieList(),
    ),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          NewsScreen.route:(ctx)=>NewsScreen(),
          NDTV.route:(ctx)=>NDTV(),
          Ndtvlatest.route:(ctx)=>Ndtvlatest(),
        },
      ),

    );
  }
}

