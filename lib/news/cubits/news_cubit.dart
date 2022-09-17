import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/news/models/news_response.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  List<Articles> articles = [];

  void getNews({
    required String category,
    String country = "eg",
  }) async {
    try {
      var response = await Dio()
          .get('https://newsapi.org/v2/top-headlines', queryParameters: {
        "country": country,
        "category": category,
        "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64"
      });

      NewsResponse newsResponse = NewsResponse.fromJson(response.data);

      articles = newsResponse.articles;
      emit(GetNewsSuccessState());

    } catch (e) {
      print(e);
      emit(GetNewsFailureState(e.toString()));
    }
  }
}
