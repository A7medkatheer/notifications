part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsSucces extends GetNewsState {
  final GetNewsModel? response;
  GetNewsSucces({required this.response});
}

final class GetNewsError extends GetNewsState {}
