import 'package:bloc/bloc.dart';
import 'package:dev_app_broseph/data/news_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'everything_state.dart';
part 'everything_cubit.freezed.dart';

class EverythingCubit extends Cubit<EverythingState> {
  EverythingCubit(this.dio) : super(EverythingState.Loading());

  final Dio dio;

  void init() async {
    emit(_Loading());
    try {
      final result = await dio.get(
          'everything?q=apple&from=2023-05-01&to=2023-05-12&sortBy=popularity&apiKey=38823f356abb4c6d9fa19f68dd78b40b');
      final newModelList = (result.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      emit(_Seccuse(newModelList));
    } on DioError catch (e) {
      emit(_Error(e.message ?? ""));
    }
  }

  Future<void> refresh() async {
    emit(_Loading());
    try {
      final result = await dio.get(
          'everything?q=apple&from=2023-05-01&to=2023-05-12&sortBy=popularity&apiKey=38823f356abb4c6d9fa19f68dd78b40b');
      final newModelList = (result.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      print(newModelList);

      emit(_Seccuse(newModelList));
    } on DioError catch (e) {
      emit(_Error(e.message ?? ""));
    }
  }
}
