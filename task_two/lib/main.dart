import 'package:flutter/material.dart';
import 'package:task_two/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'LOGIN',
                      style: (TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Login now to browse our hot offers',
                      style: (TextStyle(color: Colors.grey, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'mail',
                        hintText: 'enter your mail'),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'password',
                        hintText: 'enter your password'),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                      onPressed: () {
                        if (emailController.text=='hassan'&&passwordController.text=='123456'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondPage()),
                          );
                        }else{
                          final snackBar = SnackBar(
                            content: const Text('Wrong Email or Password'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                      child:const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                 const SizedBox(
                    height: 30.0,
                  ),
                  const  Text('hint : the valid mail is hassan and password is 123456')
                  
                  
                ],
              )),
        ),
      ),
    );
  }
}
