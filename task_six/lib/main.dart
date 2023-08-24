import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_six/modules/cubit/states.dart';
import 'package:task_six/shared/network/remote/dio_helper.dart';

import 'modules/cubit/cubit.dart';

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
            create: (BuildContext context) => WeatherCubit(),
          ),
        ],
        child: BlocConsumer<WeatherCubit, WeatherStates>(
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
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter text to search';
                    }

                    return null;
                  },
                  controller: searchController,
                  keyboardType: TextInputType.text,
                ),
                TextButton(
                    onPressed: () {
                      cubit.getWeathersData(
                          searchController.value.text.toString());
                    },
                    child: const Text('search')),
                (state is WeatherLoadingInitialState)
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ((state is WeatherSuccessState)
                        ?  Center(
                            child: Column(
                              children: [
                                Text('the weather is ${cubit.weathermodel!.current!.condition!.text}'),
                               const SizedBox(height: 10,),
                                Text('the time is ${cubit.weathermodel!.current!.lastUpdated}'),
                                const SizedBox(height: 10,),
                                Text('the weather degree in temp  is ${cubit.weathermodel!.current!.tempC} degree'),
                                const  SizedBox(height: 10,),
                                Text('the weather degree in fer  is ${cubit.weathermodel!.current!.tempF} degree'),
                              ],
                            ),
                          )
                        : (state is WeatherErrorState)
                            ? const Center(
                                child: Text(
                                    'sorry the entered country not found please try another'),
                              )
                            : const SizedBox()),
              ],
            ),
          ),
        );
      },
    ));
  }
}
