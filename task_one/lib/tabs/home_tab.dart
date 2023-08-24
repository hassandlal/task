import 'package:flutter/material.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: const FlutterLogo(),
              title: Text('user number $index'),
            ),
           const Divider()
          ],
        );
      },
      itemCount: 10,
    );
  }
}
