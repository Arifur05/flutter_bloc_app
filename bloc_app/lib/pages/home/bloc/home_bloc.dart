import 'package:bloc_app/api.dart';
import 'package:bloc_app/models/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState>{
  HomeBloc({required this.apiService}) : super(LoadingState());

  final Api apiService;
  late NewsModel newsmodel;
  void getNewsData()async{
    print("called");
    try {
     newsmodel = await apiService.getNews();
      emit(LoadedState(newsmodel));
    }
    catch (e){
      throw e;
    }
  }
}