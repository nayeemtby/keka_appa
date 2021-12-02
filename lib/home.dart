import 'package:flutter/material.dart';
import 'package:keka_apa/components.dart';
import 'home_components.dart';

class RecipeHome extends StatelessWidget {
  const RecipeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text("Keka Apar Recipe App"),
        ),
        body: Column(
          children: [
            TabBar(
                unselectedLabelColor: Colors.redAccent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Colors.redAccent, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: const [
                  Tab(
                    child: Text("Rice"),
                  ),
                  Tab(
                    child: Text("Bread"),
                  ),
                  Tab(
                    child: Text("Desert"),
                  ),
                  Tab(
                    child: Text("Fast-Food"),
                  ),
                  Tab(
                    child: Text("Non-Veg"),
                  ),
                ]),
            const Expanded(
                child: TabBarView(children: [
              TabScreen(cat: 'rice'),
              TabScreen(cat: 'bread'),
              TabScreen(cat: 'dessert'),
              TabScreen(cat: 'fast_food'),
              TabScreen(cat: 'non_veg'),
            ]))
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black87,
        child: Column(
          children: [
            Image.asset(
              'assets/images/rice/1.jpg',
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BtnDrawer(
                    "All Recipes",
                    items: 50,
                  ),
                  const BtnDrawer("My Recipes"),
                  const BtnDrawer("Favourite"),
                  const BtnDrawer("Cooked"),
                  const BtnDrawer("Tips"),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 12),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "MORE",
                          style: TextStyle(color: Colors.white54),
                        )),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.white24,
                  ),
                  const BtnDrawerIcon(
                    txt: "Search",
                    icon: Icons.search,
                  ),
                  const BtnDrawerIcon(
                      txt: "Rate Us", icon: Icons.thumb_up_sharp),
                  const BtnDrawerIcon(txt: "Update", icon: Icons.sync),
                  const BtnDrawerIcon(
                      txt: "More Apps", icon: Icons.widgets_rounded),
                  const BtnDrawerIcon(txt: "Bangla Recipes", icon: Icons.info),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
