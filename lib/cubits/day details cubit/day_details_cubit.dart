import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/day%20details%20cubit/states.dart';
import 'package:weather_app/models/day_model.dart';
import '/services/weather_service.dart';
class DayDetailsCubit extends Cubit<WeatherState>{
  DayDetailsCubit():super(NoWeatherSate(color: const Color.fromARGB(255, 68, 180, 255)));
  void search(String cityname) async {
    dynamic response = await getweatherdata(cityname);
    try{
      List<Day> days = response;
      emit(MainWeatherDataState(days: days,color: getWeatherColor(days[0].weatherstate)));
    }catch(e){
      emit(WeatherErrorState(massage: response,color: Colors.red));
    }
  }
  Color getWeatherColor([String? weatherCondition]){
    if(weatherCondition == null){
      return const Color.fromARGB(255, 68, 180, 255);
    }
    else{
      switch (weatherCondition.toLowerCase()){
        case "sunny":
          return const Color.fromARGB(255, 255, 213, 0);
        case "clear":
          return const Color.fromARGB(255, 0, 48, 72);
        case "partly cloudy":
          return const Color.fromARGB(255, 241, 145, 0);
        case "cloudy":
          return const Color.fromARGB(255, 119, 119, 119);
        case "overcast":
          return Colors.blueGrey;
        case "mist":
          return const Color.fromARGB(255, 0, 136, 199);
        case "patchy rain possible":
          return const Color.fromARGB(255, 70, 132, 0);
        case "patchy snow possible":
          return const Color.fromARGB(255, 162, 236, 241);
        case "patchy sleet possible":
          return Colors.lightBlueAccent;
        case "patchy freezing drizzle possible":
          return const Color.fromARGB(255, 107, 173, 203);
        case "thundery outbreaks possible":
          return Colors.deepPurple;
        case "heavy rain":
          return const Color.fromARGB(255, 0, 67, 201);
        case "fog":
          return const Color.fromARGB(255, 95, 94, 97);
        case "light snow":
          return const Color(0xff00FFFF);
        case "freezing fog":
          return const Color.fromARGB(255, 125, 241, 241);
        case "light freezing rain":
          return const Color.fromARGB(255, 98, 211, 255);
        // Add more color cases for other weather conditions
        default:
          return const Color.fromARGB(255, 68, 180, 255);
      }
    }
  }
}