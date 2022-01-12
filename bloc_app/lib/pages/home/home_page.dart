import 'package:bloc_app/api.dart';
import 'package:bloc_app/models/news_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsModel? newsmodel;

  @override
  void initState() {
    getNews();
    super.initState();
    print('Called');


  }

 void getNews() async {
    newsmodel = await Api.getNews();
    print(newsmodel!.articles!.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: newsmodel != null
              ? ListView.builder(
            shrinkWrap: true,
                  itemCount: newsmodel!.articles!.length,
                  itemBuilder: (context, index) =>
                      Text(newsmodel!.articles![index].title!, style: const TextStyle(fontSize: 20),),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
