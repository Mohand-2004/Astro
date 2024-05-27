import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/day%20details%20cubit/day_details_cubit.dart';
import 'package:weather_app/screens/home_screen.dart';
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      builder: (context, child){
        return BlocProvider(
          create: (context) => DayDetailsCubit(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
void main(){
  runApp(const WeatherApp());
}