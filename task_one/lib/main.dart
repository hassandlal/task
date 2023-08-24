import 'package:flutter/material.dart';
import 'package:task_one/tabs/home_tab.dart';
import 'package:task_one/tabs/profile_tab.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.person)),

              ],
            ),
            title: const Text('Tabs Demo'),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [
              HomeTabPage(),
              ProfileTabPage(),

            ],
          ),
        ),
      ),
    );
  }
}