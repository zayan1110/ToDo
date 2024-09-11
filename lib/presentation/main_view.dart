import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/database.dart';
import '../domain/todo_model.dart';
import 'pages/events_page.dart';
import 'pages/tasks_page.dart';
import 'pages/todo_page.dart';
import 'resources/routes.dart';
import 'widgets/dialog_box.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  static late TabController _tabController;
  static final Database db = Database(AppConstants.toDoBoxKey);
  static final TextEditingController _controller = TextEditingController();

  @override
  void dispose() => {_tabController.dispose(), super.dispose()};

  @override
  void initState() => {
        _tabController = TabController(length: 3, vsync: this),
        super.initState()
      };

  void saveNew() => {
        setState(() => db.addToDatabase(ToDo(name: _controller.text))),
        _controller.clear(),
        Navigator.pop(context)
      };

  void createNew(BuildContext context) => showDialog(
      context: context,
      builder: (context) => DialogBox(
          onSave: saveNew,
          controller: _controller,
          onCancel: Navigator.of(context).pop));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        // ToDo: Dynamic or Remove
        title: const Text('Good Morning,\nMohamed!'),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () =>
                  Navigator.pushNamed(context, NamedRoutes.settingsScreen))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        hintText: 'Search')),
              ),
              const SizedBox(height: 25),
              TabBar(controller: _tabController, tabs: const [
                Tab(text: 'TO DO'),
                Tab(text: 'Events'),
                Tab(text: 'Tasks')
              ]),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: const [ToDoPage(), EventsPage(), TasksPage()])),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => createNew(context)),
    );
  }
}
