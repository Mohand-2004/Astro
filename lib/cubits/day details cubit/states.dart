import 'package:flutter/material.dart';
import '/models/day_model.dart';
abstract class WeatherState{
  final Color color;
  WeatherState({required this.color});
}
class NoWeatherSate extends WeatherState{
  NoWeatherSate({required super.color});
}
class MainWeatherDataState extends WeatherState{
  final List<Day> days;
  MainWeatherDataState({required this.days,required super.color});
}
class WeatherErrorState extends WeatherState{
  final String massage;
  WeatherErrorState({required this.massage,required super.color});
}