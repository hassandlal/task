import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_three/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context)=>CounterProvider(),child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<CounterProvider>(
        builder: (context,model,child){

          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton(
                        onPressed: () {
                          model.changeCounterValue('u');
                        },
                        child: const Text('increase')),
                    ElevatedButton(
                        onPressed: () {
                          model.changeCounterValue('d');
                        },
                        child: const Text('decrease')),
                  ],

                )
              ],
            ),
          );
        },

      ), // This trailing comma makes auto-formatting nicer for build methods.
    ),);
  }
}
