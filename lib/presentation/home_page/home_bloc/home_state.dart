part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedFullState extends HomeState {
  final AnalysisModel analysisModel;
  final ResultModel resultModel;

  HomeLoadedFullState({
    required this.analysisModel,
    required this.resultModel,
  });
}

final class HomeLoadedEmptyState extends HomeState {}
