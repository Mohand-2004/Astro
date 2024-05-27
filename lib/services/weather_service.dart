import 'package:dio/dio.dart';
import 'package:weather_app/models/day_model.dart';
Future<dynamic> getweatherdata(String city) async {
  if(city == ""){
    return "Please Enter the city";
  }
  List<Day> days = [];
  Response reasponse;
  try{
    reasponse = await Dio().get("http://api.weatherapi.com/v1/forecast.json?key=3403704a3df146379dd93549242001&q=$city&days=10&aqi=no&alerts=no");
    List dayslist = reasponse.data["forecast"]["forecastday"];
    String lastupdated = reasponse.data["current"]["last_updated"];
    String location = reasponse.data["location"]["name"];
    for(var element in dayslist){
      days.add(Day.fromJson(json: element, loc: location, upda: lastupdated));
    }
    return days;
  }on DioException catch(badresponse){
    if(badresponse.response == null){
      return "Unexpected Error!";
    }
    else{
      return badresponse.response?.data['error']['message'];
    }
  }catch(e){
    return "Unexpected Error!";
  }
}