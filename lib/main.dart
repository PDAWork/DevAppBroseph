import 'package:dev_app_broseph/home/presentation/home.dart';
import 'package:dev_app_broseph/locator_service.dart';
import 'package:dev_app_broseph/news/everything/domain/cubit/everything_cubit.dart';
import 'package:dev_app_broseph/news/top_headlines/domain/cubit/top_headlines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<TopHeadlinesCubit>()..init(),
          ),
           BlocProvider(
            create: (context) => sl<EverythingCubit>()..init(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
