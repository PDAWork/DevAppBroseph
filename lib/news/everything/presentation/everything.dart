import 'package:dev_app_broseph/news/everything/domain/cubit/everything_cubit.dart';
import 'package:dev_app_broseph/news/widget/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Everything extends StatelessWidget {
  const Everything({key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EverythingCubit, EverythingState>(
      builder: (context, state) {
        return state.when(
          Loading: () => Center(child: CircularProgressIndicator()),
          Seccuse: (list) => RefreshIndicator(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  title: list[index].title,
                  urlImage: list[index].urlImage,
                  description: list[index].description ?? "",
                );
              },
            ),
            onRefresh: () => context.read<EverythingCubit>().refresh(),
          ),
          Error: (error) => Text(error),
        );
      },
    );
  }
}
