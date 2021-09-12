import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/accesories.feed.dart';
import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/dressing.feed.dart';
import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/electronics.feed.dart';
import 'package:flutter/material.dart';

class FeedView extends StatefulWidget {
  FeedView({Key? key}) : super(key: key);

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: Drawer(),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  actions: [Icon(Icons.search_sharp)],
                  backgroundColor: Colors.black87,
                  title: Text('Explore here!'),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('Dressing')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Accesories')),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                DressingFeed(),
                ElectronicsFeed(),
                AccesoriesFeed()
              ],
            ),
          )),
    );
  }
}
