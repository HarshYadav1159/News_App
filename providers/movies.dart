import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';
class MovieList extends ChangeNotifier{

  // final List<Movie> _movies=[
  //   Movie(title: 'Avengers', genre: 'Action,Drama,Thriller'),
  //   Movie(title: 'title', genre: 'genre'),
  // ];
Future<void> fetchABP()async{
  List link=[];
  final url = Uri.parse('https://news.abplive.com/news/india');
  final response = await http.get(url);
  dom.Document document = parser.parse(response.body);
  final element = document.getElementsByClassName('other_news');
  final element1 = document.getElementsByClassName('other_news');
  // for(int i=0;i<=7;i++){
   List<String? >loadLink = element
        .map((element) =>
    element.getElementsByTagName('a')[0].attributes['href'])
        .toList();
  List<String? >loadtitle = element
      .map((element) =>
  element.getElementsByTagName('a')[0].attributes['title'])
      .toList();
  List<String? >loadimg = element1
      .map((element) =>
  element.getElementsByClassName('img4x3')[0].getElementsByTagName('img')[0].attributes['data-src'])
      .toList();
    link=loadLink;
  // }
  print(link);
  print(loadtitle);
  print(loadimg);



}


  Future<void> fetchNDTV() async{
    try{
      final url = Uri.parse('https://www.ndtv.com/elections/elections-news');
      final response = await http.get(url);
      dom.Document document = parser.parse(response.body);
      final element = document
          .getElementsByClassName(
              'elec14_storylist election14_insidenewslist')[0]
          .getElementsByClassName('storylist_img');
      final element1 = document
          .getElementsByClassName(
              'elec14_storylist election14_insidenewslist')[0]
          .getElementsByClassName('storylist_img');
      final element2 = document
          .getElementsByClassName(
              'elec14_storylist election14_insidenewslist')[0]
          .getElementsByClassName('storylist_img');
      List<String?> loadLink = element1
          .map((element) =>
              element.getElementsByTagName('a')[0].attributes['href'])
          .toList();
      List<String?> loadTitle = element2
          .map((element) => element
              .getElementsByTagName('a')[0]
              .getElementsByClassName('img_brd marr10')[0]
              .attributes['alt'])
          .toList();
      List<String?> loadImageUrl = element
          .map((element) => element
              .getElementsByTagName('a')[0]
              .getElementsByClassName('img_brd marr10')[0]
              .attributes['src'])
          .toList();
      // print(loadImageUrl);
      // print(loadTitle);
      // print(loadLink);
    }catch(error){
      throw error;
    }
    notifyListeners();

  }

  Future<void> fetchFirstpost() async{
    final url = Uri.parse('https://www.firstpost.com/category/india');
    final response = await http.get(url);
    dom.Document document=parser.parse(response.body);
    final element=document.getElementsByClassName('main-container')[0].getElementsByClassName('main-content')[0].getElementsByClassName('big-thumb');
    List<String?> image=element.map((element) => element.getElementsByTagName('img')[0].attributes['data-src']).toList();
    List<String?> title=element.map((element) => element.getElementsByTagName('img')[0].attributes['title']).toList();
    List<String?> link=element.map((element) => element.getElementsByTagName('a')[0].attributes['href']).toList();

  }


  Future<void> fetchbollywoodHungama() async {
    final url = Uri.parse('https://www.bollywoodhungama.com/');
    final response = await http.get(url);
    dom.Document document = parser.parse(response.body);
    final element=document.getElementsByClassName('row clearfix bh-top-grid grid-9')[0].getElementsByClassName('bh-title');
    final element1=document.getElementsByClassName('row clearfix bh-top-grid grid-9')[0].getElementsByClassName('bh-grid-post-container')[0].getElementsByClassName('bh-grid-post-content');
    List<String?> loadLink=element.map((element) => element.getElementsByTagName('a')[0].attributes['href']).toList();
    List<String?> loadTitle=element.map((element) => element.getElementsByTagName('a')[0].attributes['title']).toList();
    List<String?> loadImage=element1.map((element) => element.getElementsByTagName('a')[0].innerHtml).toList();
    print(loadTitle);
    print(loadLink);
    print(loadImage);
  }
}