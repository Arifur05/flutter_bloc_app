import 'package:bloc_app/models/news_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{

  HomeState();
}

class LoadingState extends HomeState{
  @override
  // TODO: implement props
  List<Object> get props => [];


}
class LoadedState extends HomeState{

  LoadedState(this.news);
  late NewsModel news;
  @override
  // TODO: implement props
  List<Object> get props => [news];

}