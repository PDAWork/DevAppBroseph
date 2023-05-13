import 'package:dev_app_broseph/favourites/presentation/favourites.dart';
import 'package:dev_app_broseph/news/everything/domain/cubit/everything_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dev_app_broseph/home/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;
  int _bottomIndex = 0;

  late List<Widget> _pageList;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
    _pageList = [
      NewsPage(tabController: _tabController),
      Favourites(),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _bottomIndex != 1
            ? AppBar(
                backgroundColor: Color(0xFF1B1B1F),
                centerTitle: true,
                elevation: 0,
                title: Text(_tabIndex == 0 ? "Top headlines" : "Everything"),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _bottomIndex,
            onTap: (value) {
              setState(() {
                _bottomIndex = value;
                if (_bottomIndex == 1) {
                  context.read<EverythingCubit>().init();
                }
              });
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xffc3c5dd),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Новости',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: 'Закладки',
              ),
            ]),
        body: _pageList[_bottomIndex],
      ),
    );
  }
}
