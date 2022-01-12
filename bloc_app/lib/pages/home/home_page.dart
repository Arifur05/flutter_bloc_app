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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context,state){
            if (state is LoadingState){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return Text("No Data Found!");
            }
          }
        )
      ),
    );
  }
}
