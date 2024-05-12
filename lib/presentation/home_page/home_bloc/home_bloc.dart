import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poker/data/models/analysis_model/analysis_model.dart';

import '../../../data/data_manager.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeGetEvent>(_onGetData);
  }

  _onGetData(HomeGetEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    AnalysisModel analysisModel = await DataManager.loadAnalysisModel();

    if (analysisModel.game == -1) {
      emit(HomeLoadedEmptyState());
    } else {
      emit(HomeLoadedFullState(
          analysisModel: analysisModel,
          resultModel: resultAnalysis(analysisModel)));
    }
  }

  ResultModel resultAnalysis(AnalysisModel analysis) {
    return ResultModel(
        title: 'Experienced player',
        description:
            'You have a balanced style. You flexibly adapt to different situations in the game.\n\nYou skillfully use bluffs and manage bets depending on the combination of cards, most likely have a good strategic foundation.');
  }
}
