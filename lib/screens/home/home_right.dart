import 'package:dogehouse_flutter/components/profile_card.dart';
import 'package:dogehouse_flutter/components/right_header.dart';
import 'package:dogehouse_flutter/components/upcoming_rooms_card.dart';
import 'package:dogehouse_flutter/provider/doge_provider.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRight extends StatefulWidget {
  @override
  _HomeRightState createState() => _HomeRightState();
}

class _HomeRightState extends State<HomeRight> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DogeProvider>(builder: (context, model, _) {
      return Container(
        color: Palette.scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [Container()],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: RightHeader(model.me),
              centerTitle: true,
              floating: true,
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: ProfileCard(model.me),
            ),
            SliverToBoxAdapter(
              child: UpcomingRoomsCard(),
            ),
          ],
        ),
      );
    });
  }
}
