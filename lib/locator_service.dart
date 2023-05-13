import 'package:dev_app_broseph/news/everything/domain/cubit/everything_cubit.dart';
import 'package:dev_app_broseph/news/top_headlines/domain/cubit/top_headlines_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => TopHeadlinesCubit(sl()));
  sl.registerLazySingleton(() => EverythingCubit(sl()));

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/v2/",
      ),
    )..interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ],
      ),
  );
}
