import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic_layer/cubits/weather_states.dart';

import '../../data_layer/models/weather_model.dart';
import '../../data_layer/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  //WeatherService weatherService = WeatherService(); or
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailure());
      print("Error $e");
    }
  }
}
