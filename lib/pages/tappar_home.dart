import 'package:flutter/material.dart';
import 'package:todo_app/pages/events.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/task.dart';

class TapparHome extends StatefulWidget {
  const TapparHome({super.key});

  @override
  _TapparHomeState createState() => _TapparHomeState();
}

class _TapparHomeState extends State<TapparHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        toolbarHeight: 200,
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.settings,
        //       color: Theme.of(context).colorScheme.background,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pushNamed('/settingPage');
        //     },
        //   ),
        // ],
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good Morning,',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/settingPage');
                  },
                ),
              ],
            ),
            Text(
              'Mohamed !',
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search here...",
                ),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'TO DO',
            ),
            Tab(
              text: 'EVENTS',
            ),
            Tab(
              text: 'TASK',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomPage(),
                Events(),
                Task(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
