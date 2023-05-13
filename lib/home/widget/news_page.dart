import 'package:flutter/material.dart';
import 'package:dev_app_broseph/home/index.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF1B1B1F),
            child: TabBar(controller: _tabController, tabs: const [
              Tab(
                icon: Icon(Icons.list_alt),
              ),
              Tab(icon: Icon(Icons.list)),
            ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              TopHeadlines(),
              Everything(),
            ]),
          )
        ],
      ),
    );
  }
}
