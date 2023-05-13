part of 'everything_cubit.dart';

@freezed
class EverythingState with _$EverythingState {
  const factory EverythingState.Loading() = _Loading;
  const factory EverythingState.Seccuse(List<NewsModel> newModelList) = _Seccuse;
  const factory EverythingState.Error(String message) = _Error;
}
