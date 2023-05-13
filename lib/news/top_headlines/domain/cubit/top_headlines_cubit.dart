import 'package:bloc/bloc.dart';
import 'package:dev_app_broseph/data/news_model.dart';
import 'package:dev_app_broseph/data/source_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'top_headlines_state.dart';
part 'top_headlines_cubit.freezed.dart';

class TopHeadlinesCubit extends Cubit<TopHeadlinesState> {
  TopHeadlinesCubit(this.dio) : super(TopHeadlinesState.Loading());

  final Dio dio;

  void init() async {
    emit(_Loading());
    try {
      final result = await dio.get(
          'top-headlines?country=us&category=business&apiKey=38823f356abb4c6d9fa19f68dd78b40b');
      final newModelList = (result.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      print(newModelList[0]);
      emit(_Seccuse(newModelList));
    } on DioError catch (e) {
      emit(_Error(e.message ?? ""));
    }
  }

  void pagination() {}

  void addFavourites(NewsModel newsModel) {
    state.whenOrNull(
      Seccuse: (newModelList) {
        newModelList
            .firstWhere((element) =>
                element.sourceModel.name == newsModel.sourceModel.name)
            .isCheck = !newsModel.isCheck;

        emit(_Seccuse(newModelList));
      },
    );
  }

  Future<void> refresh() async {
    emit(_Loading());

    try {
      final result = await dio.get(
          'top-headlines?country=us&category=business&apiKey=38823f356abb4c6d9fa19f68dd78b40b');
      final newModelList = (result.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      emit(_Seccuse(newModelList));
    } on DioError catch (e) {
      emit(_Error(e.message ?? ""));
    }
  }
}
