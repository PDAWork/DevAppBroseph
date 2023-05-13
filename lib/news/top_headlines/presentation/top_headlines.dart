import 'package:dev_app_broseph/news/top_headlines/domain/cubit/top_headlines_cubit.dart';
import 'package:dev_app_broseph/news/widget/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopHeadlines extends StatelessWidget {
  const TopHeadlines({key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopHeadlinesCubit, TopHeadlinesState>(
      builder: (context, state) {
        return state.maybeWhen(
            Loading: () => Center(child: CircularProgressIndicator()),
            Seccuse: (list) => RefreshIndicator(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        onTap: () {
                          context
                              .read<TopHeadlinesCubit>()
                              .addFavourites(list[index]);
                        },
                        title: list[index].title,
                        urlImage: list[index].urlImage,
                        description: list[index].description ?? "",
                        isCheck: list[index].isCheck,
                      );
                    },
                  ),
                  onRefresh: () => context.read<TopHeadlinesCubit>().refresh(),
                ),
            Error: (error) => Text(error),
            orElse: () {
              return Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
