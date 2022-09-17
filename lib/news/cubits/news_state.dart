part of 'news_cubit.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class GetNewsSuccessState extends NewsStates {}

class GetNewsFailureState extends NewsStates {
  final String errorMessage;

  GetNewsFailureState(this.errorMessage);
}
