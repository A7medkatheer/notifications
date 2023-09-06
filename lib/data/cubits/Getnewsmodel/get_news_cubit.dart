import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/data/Repository/getnewsrepo.dart';
import 'package:newsapp/data/models/getnewsmodel.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());
  GetNewsRepo NewsRepo = GetNewsRepo();

  getnews() async {
    emit(GetNewsLoading());

    try {
      await NewsRepo.getNews().then((value) {
        if (value != null) {
          emit(GetNewsSucces(
            response: value,
          ));
        } else {
          emit(GetNewsError());
        }
      });
    } catch (error) {
      emit(GetNewsError());
    }
  }
}
