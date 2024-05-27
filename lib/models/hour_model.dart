import 'package:flutter/material.dart';
class Hour {
  late String visability;
  late String temp;
  late String time;
  late String weatherstate;
  late ImageProvider weatherstateicon;
  late String rainchane;
  late String snowchane;
  late String windspeed;
  String gettime(){
    int spaceindex = 0;
    for(int i = 0;i<time.length;i++){
      if(time[i]==' '){
        spaceindex = i;
        break;
      }
    }
    return time.substring(spaceindex);
  }
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
  Hour({required double visability,required double temp,required this.time,required this.weatherstate,required String? imageurl,required int rainchane,required int snowchane,required double windspeed}){
    this.visability = "$visability km";
    this.temp = "$temp C";
    time = gettime();
    weatherstateicon = geticon(imageurl);
    this.rainchane = "$rainchane %";
    this.snowchane = "$snowchane %";
    this.windspeed = "$windspeed km/h";
  }
  factory Hour.fromJson(Map jsondata){
    return Hour(
      visability: jsondata["vis_km"],
      temp: jsondata["temp_c"],
      time: jsondata["time"],
      weatherstate: jsondata["condition"]["text"],
      imageurl: jsondata["condition"]["icon"],
      rainchane: jsondata["chance_of_rain"],
      snowchane: jsondata["chance_of_snow"],
      windspeed: jsondata["wind_kph"]
    );
  }
}