import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/ui/app/app.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'package:responsive_scaffold/utils/breakpoint.dart';

import '../data/classes/email.dart';
import '../data/dummy_data.dart';
import 'common/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmailItem> _emails;
  @override
  void initState() {
    _emails = emails;
    super.initState();
  }

  final Size _tabletBreakpoint = const Size(510.0, 510.0);

  @override
  Widget build(BuildContext context) {
    final bool tablet = isTablet(context, breakpoint: _tabletBreakpoint);
    return ResponsiveScaffold.builder(
      tabletBreakpoint: _tabletBreakpoint,

      drawer: const AppDrawer(),
      tabletSideMenu: tablet
          ? const Flexible(
              flex: 1,
              child: AppSideMenu(),
            )
          : null,
      tabletFlexListView: 4,
      slivers: <Widget>[
        SliverFloatingBar(
          floating: true,
          automaticallyImplyLeading: !tablet,
          title: const TextField(
            decoration: InputDecoration.collapsed(hintText: "Search mail"),
          ),
          trailing: const CircleAvatar(
            child: Text("RD"),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: const Text("All Inboxes"),
          ),
        ),
      ],
      itemCount: _emails?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final i = _emails[index];
        final bool lastItem = (index + 1) == emails?.length ?? 0;
        if (lastItem) {
          return Container(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: EmailListTile(
              item: i,
              favoriteChanged: () {
                setState(() {
                  i.favorite = !i.favorite;
                });
              },
            ),
          );
        }
        return EmailListTile(
          item: i,
          favoriteChanged: () {
            setState(() {
              i.favorite = !i.favorite;
            });
          },
        );
      },
      // ignore: missing_return
      floatingActionButton: const EmailFAB(),
      // ignore: missing_return
      detailBuilder: (BuildContext context, int index, bool tablet) {},
    );
  }
}
