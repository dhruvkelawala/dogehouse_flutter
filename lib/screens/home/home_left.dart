import 'package:dogehouse_flutter/items/people_item.dart';
import 'package:dogehouse_flutter/provider/doge_provider.dart';
import 'package:dogehouse_flutter/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLeft extends StatefulWidget {
  @override
  _HomeLeftState createState() => _HomeLeftState();
}

class _HomeLeftState extends State<HomeLeft> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DogeProvider>(builder: (context, model, _) {
      return Container(
        color: Palette.scaffoldBackgroundColor,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [Container()],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'DogeHouse',
                        style: TextStyle(color: Palette.primaryColor, fontSize: 25),
                      ),
                    ],
                  )),
              centerTitle: true,
              floating: false,
              pinned: true,
              elevation: 0,
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [Container()],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'People',
                        style: TextStyle(color: Palette.lightWhite),
                      ),
                      Spacer(),
                    ],
                  ),
                  Text(
                    'ONLINE (${model.following.length})',
                    style: TextStyle(color: Palette.lightBlue, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              centerTitle: true,
              floating: false,
              pinned: true,
            ),
          ],
          body: RefreshIndicator(
            color: Palette.primaryColor,
            onRefresh: () => model.getInfos(),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return PeopleItem(model.following[index]);
              },
              itemCount: model.following.length,
            ),
          ),
        ),
      );
    });
  }
}
