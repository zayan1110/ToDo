import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import 'pages/events_page.dart';
import 'pages/tasks_page.dart';
import 'pages/Todo_page.dart';
import 'resources/app_colors.dart';
import 'resources/routes.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  static late TabController _tabController;

  @override
  void dispose() => {_tabController.dispose(), super.dispose()};

  @override
  void initState() => {_tabController = TabController(length: 3, vsync: this), super.initState()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        // Todo: Dynamic or Remove
        title: const Text('Good Morning'),
        actions: [IconButton(icon: const Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, NamedRoutes.settingsScreen))],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              const Timeline(),

              // Space
              const SizedBox(height: 25),

              // TabBar
              TabBar(controller: _tabController, tabs: const [Tab(text: 'TO DO'), Tab(text: 'Events'), Tab(text: 'Tasks')]),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: TabBarView(controller: _tabController, children: const [TodoPage(), EventsPage(), TasksPage()])),
        ],
      ),
    );
  }
}

class Timeline extends StatefulWidget {
  static DateTime focusDate = DateTime.now();
  static EasyInfiniteDateTimelineController controller = EasyInfiniteDateTimelineController();

  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;

    return EasyInfiniteDateTimeLine(
      showTimelineHeader: false,
      focusDate: Timeline.focusDate,
      firstDate: _startWithSaturday(),
      controller: Timeline.controller,
      activeColor: AppColors.primary,
      lastDate: DateTime.now().add(const Duration(days: 365)),
      onDateChange: (pickedDate) => setState(() => Timeline.focusDate = pickedDate),
      dayProps: EasyDayProps(
        height: 80,
        width: size!.width / 8.44,
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: const DayStyle(dayNumStyle: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }

  DateTime _startWithSaturday() => DateTime.now().subtract(Duration(days: (DateTime.now().weekday % 6 + (DateTime.now().weekday > 5 ? 0 : 1))));
}
