import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic_layer/cubits/weather_states.dart';
import 'package:weather_app/logic_layer/cubits/weathet_cubit.dart';
import 'package:weather_app/presintation_layer/pages/search_page.dart';
import '../../data_layer/models/weather_model.dart';
import '../widgets/custom_defult.dart';
import '../widgets/custom_success.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (BuildContext context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return CustomSuccessWidget(
              weatherData: state.weatherModel,
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text(
                'weather Failure 😔 ...',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          } else {
            // Initial State
            return const CustomDefaultWidget();
          }
        },
      ),
    );
  }
}
