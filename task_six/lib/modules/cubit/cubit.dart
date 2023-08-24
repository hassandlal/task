import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_six/models/weather.dart';
import 'package:task_six/modules/cubit/states.dart';

import '../../shared/constants.dart';
import '../../shared/network/remote/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  weatherModel? weathermodel;

  void getWeathersData(String location) {
    emit(WeatherLoadingInitialState());

    DioHelper.getData(
            url:
                'https://api.weatherapi.com/v1/current.json?key=$ApiKey&q=$location&aqi=no')
        .then((value) {
      weathermodel = weatherModel.fromJson(value.data);

      emit(WeatherSuccessState());
    }).catchError((error) {
      emit(WeatherErrorState());
    });
  }
}
