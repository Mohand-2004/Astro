import 'package:flutter/material.dart';
import 'package:weather_app/models/hour_model.dart';
class Day{
  late String location;
  late String maxtemp;
  late String mintemp;
  late String avgtemp;
  late String weatherstate;
  late ImageProvider weatherstateicon;
  late String date;
  late String updatedtime;
  late String sunrisetime;
  late String sunsettime;
  late String moonrisetime;
  late String moonsettime;
  late String windspeed;
  late String visability;
  late String rainchane;
  late String snowchane;
  late List<Hour> hours;
  ImageProvider geticon(String? imageurl){
    if(imageurl == null){
      return const AssetImage('assets/images/5726532.png');
    }
    else{
      try{
        return NetworkImage("https:$imageurl");
      }
      catch(error){
        return const AssetImage('assets/images/5726532.png');
      }
    }
  }
  String gettime(){
    int spaceindex = 0;
    for(int i = 0;i<updatedtime.length;i++){
      if(updatedtime[i]==' '){
        spaceindex = i;
        break;
      }
    }
    return updatedtime.substring(spaceindex);
  }
  List<Hour> buildhours(List hours){
    List<Hour> hoursob = [];
    for (var element in hours){
      hoursob.add(Hour.fromJson(element));
    }
    return hoursob;
  }
  Day({required this.location,required double maxtemp,required double mintemp,required double avgtemp,required this.weatherstate,required String? imageurl,required this.date,required this.updatedtime,required this.sunrisetime,required this.sunsettime,required this.moonrisetime,required this.moonsettime,required double windspeed,required double visability,required int rainchane,required int snowchane,required List hours}){
    this.maxtemp = "$maxtemp C";
    this.mintemp = "$mintemp C";
    this.avgtemp = "$avgtemp C";
    weatherstateicon = geticon(imageurl);
    updatedtime = gettime();
    this.windspeed = "$windspeed km/h";
    this.visability = "$visability km";
    this.rainchane = "$rainchane %";
    this.snowchane = "$snowchane %";
    this.hours = buildhours(hours);
  }
  factory Day.fromJson({required Map json,required String loc,required String upda}){
    return Day(
      location: loc,
      maxtemp: json["day"]["maxtemp_c"],
      mintemp: json["day"]["mintemp_c"],
      avgtemp: json["day"]["avgtemp_c"],
      weatherstate: json["day"]["condition"]["text"],
      imageurl: json["day"]["condition"]["icon"],
      date: json["date"],
      updatedtime: upda,
      sunrisetime: json["astro"]["sunrise"],
      sunsettime: json["astro"]["sunset"],
      moonrisetime: json["astro"]["moonrise"],
      moonsettime: json["astro"]["moonset"],
      windspeed: json["day"]["maxwind_kph"],
      visability: json["day"]["avgvis_km"],
      rainchane: json["day"]["daily_chance_of_rain"],
      snowchane: json["day"]["daily_chance_of_snow"],
      hours: json["hour"]
    );
  }
}