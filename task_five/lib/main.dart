import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_five/posts_module/cubit/cubit.dart';
import 'package:task_five/posts_module/cubit/states.dart';
import 'package:task_five/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => PostsCubit()..getPostsData(),
          ),
        ],
        child: BlocConsumer<PostsCubit, PostsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(),
            );
          },
        ));
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
    return Scaffold(
        body: BlocConsumer<PostsCubit, PostsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PostsCubit.get(context);
        if (state is PostsLoadingInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostsSuccessState) {
          return  Center(
            child: ListView.builder(itemCount: cubit.Posts.length,itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Id:${cubit.Posts[index].id}'),
                    Text('title :${cubit.Posts[index].title}'),
                    Text('body: ${cubit.Posts[index].body}'),
                    Divider(),
                  ],
                ),
              );
            },),
          );
        } else {
          return const Center(
            child: Text('oops, some thing went wrong, please try again later'),
          );
        }
      },
    ));
  }
}
