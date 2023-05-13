part of 'top_headlines_cubit.dart';

@freezed
class TopHeadlinesState with _$TopHeadlinesState {
  const factory TopHeadlinesState.Loading() = _Loading;
  const factory TopHeadlinesState.Seccuse(List<NewsModel> newModelList) = _Seccuse;
  const factory TopHeadlinesState.AddFavourites(List<NewsModel> newModelList) = _AddFavouritese;
  const factory TopHeadlinesState.Error(String message) = _Error;
}
