import 'package:bloc_app/api.dart';
import 'package:bloc_app/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsModel? newsmodel;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context,state){
            if (state is LoadingState){
              BlocProvider.of<HomeBloc>(context).getNewsData();
              return const Center(child: CircularProgressIndicator());

            }
            if (state is LoadedState){
              return ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  itemCount: state.news.articles!.length,
                  itemBuilder: (context, index){
                    return NewsWidget(articles: state.news.articles![index]);
              });
            }
            else{
              return const Text("No Data Found!");
            }
          }
        )
      ),
    );
  }
}
Widget NewsWidget({
  required Article articles
}){
  return GestureDetector(
    onTap: (){

    },
    child: Card(
      margin: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(articles.urlToImage!,height: 120, width: 100),
          const SizedBox(width:10),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(articles.title!, style:const TextStyle(fontSize:14, fontWeight: FontWeight.bold)),
              const SizedBox(width:10),
              Text(articles.source!.name!, style:const TextStyle(fontSize:14, fontWeight: FontWeight.bold)),
            ],
          ),),
        ],
      )

    ),
  );
}
