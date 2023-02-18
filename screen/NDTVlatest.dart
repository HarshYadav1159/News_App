import 'package:flutter/material.dart';
import 'package:movies/providers/movies.dart';
import 'package:movies/widgets/home_widget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
class Ndtvlatest extends StatefulWidget {
  const Ndtvlatest({Key? key}) : super(key: key);
  static String route='/ndtvlatest';
  @override
  State<Ndtvlatest> createState() => _NdtvlatestState();
}

class _NdtvlatestState extends State<Ndtvlatest> {
  List<String?> title=[];
  List<String?> link=[];
  List<String?> imageUrl=[];
  List<String?> title1=[];
  List<String?> link1=[];
  List<String?> imageUrl1=[];
  Future<void> fetchNDTV() async{
    try{
      final url = Uri.parse('https://www.ndtv.com/latest#pfrom=home-ndtv_mainnavgation');
      final response = await http.get(url);
      dom.Document document = parser.parse(response.body);
      final element = document
          .getElementsByClassName(
          'sp-cn ins_storybody lstng_Pg')[0]
          .getElementsByClassName('news_Itm-img');
      List<String?> loadtitle = element
          .map((element) => element
          .getElementsByTagName('a')[0].getElementsByTagName('img')[0]
          .attributes['alt'])
          .toList();
      List<String?> loadlink= element
          .map((element) => element
          .getElementsByTagName('a')[0]
          .attributes['alt'])
          .toList();
      List<String?> loadImageUrl = element
          .map((element) => element
          .getElementsByTagName('a')[0].getElementsByTagName('img')[0]
          .attributes['src'])
          .toList();
      // title1=loadTitle;
      // link1=loadLink;
      title1=loadtitle;
      link1=loadlink;
      imageUrl1=loadImageUrl;
      // print(imageUrl1.length);
    }catch(error){
      throw error;
    }
  }

  Future<void> fetchFirstpost() async{
    try{
      final url = Uri.parse('https://www.firstpost.com/category/sports');
      final response = await http.get(url);
      dom.Document document = parser.parse(response.body);
      final element = document
          .getElementsByClassName('main-container')[0]
          .getElementsByClassName('main-content')[0]
          .getElementsByClassName('big-thumb');
      List<String?> img = element
          .map((element) =>
      element.getElementsByTagName('img')[0].attributes['data-src'])
          .toList();
      List<String?> ti = element
          .map((element) =>
      element.getElementsByTagName('img')[0].attributes['title'])
          .toList();
      List<String?> li = element
          .map((element) =>
      element.getElementsByTagName('a')[0].attributes['href'])
          .toList();
      title=ti;
      link=li;
      imageUrl=img;
    }catch(error){
      throw error;
    }
  }

  Future<void> fetchABP()async{
    try{
      final url = Uri.parse('https://news.abplive.com/news/india');
      final response = await http.get(url);
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('other_news');
      final element1 = document.getElementsByClassName('other_news');
      // for(int i=0;i<=7;i++){
      List<String?> loadLink = element
          .map((element) =>
      element.getElementsByTagName('a')[0].attributes['href'])
          .toList();
      List<String?> loadtitle = element
          .map((element) =>
      element.getElementsByTagName('a')[0].attributes['title'])
          .toList();
      List<String?> loadimg = element1
          .map((element) => element
          .getElementsByClassName('img4x3')[0]
          .getElementsByTagName('img')[0]
          .attributes['data-src'])
          .toList();
      link = loadLink;
      // }
      title1=loadtitle;
      link1=loadLink;
      imageUrl1=loadimg;
    }catch(error){
      throw error;
    }
  }
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if(_isInit){
      _isLoading = true;
      fetchNDTV().then((_) {
        setState(() {
          // print(title1);
          _isLoading = false;
        });
        // fetchFirstpost().then((_) {
        //   setState(() {
        //     print(title.length);
        //     _isLoading = false;
        //   });
      });
    }
    _isInit=false;
    super.didChangeDependencies();
  }



  Future<void> refreshNews(BuildContext context)async {
    await Provider.of<MovieList>(context,listen: false).fetchFirstpost();
    await fetchNDTV();
  }
  @override
  Widget build(BuildContext context) {
    // final news = Provider.of<MovieList>(context);
    // List<Movie> title=news.news;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NDTV Latest'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: _isLoading ? const Center
        (child: CircularProgressIndicator(),)
          :RefreshIndicator(
        onRefresh: ()=>refreshNews(context),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black
          ),
          child:
          ListView.builder(
            itemCount:(title1.length),
            itemBuilder: (ctx,i)=>
                HomeWidget(
                  title1[i],
                  imageUrl1[i],
                  link1[i],
                ),

          ),
        ),
      ),

    );
  }
}
