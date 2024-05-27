import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/day%20details%20cubit/day_details_cubit.dart';
import 'package:weather_app/models/day_model.dart';
import 'package:weather_app/screens/detailes_screen.dart';
// ignore: must_be_immutable
class DayWidget extends StatelessWidget{
  Day day;
  final Color color;
  DayWidget({super.key,required this.day,required this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context) {
            return DetailedScreen(day: day,color: BlocProvider.of<DayDetailsCubit>(context).getWeatherColor(day.weatherstate),);
          },
        ));
      },
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width/1.37,
        margin: EdgeInsets.all(5.sp),
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.sp) 
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36.sp) 
          ),
          child: Column(
            children: [
              Expanded(
                flex: 57,
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: SizedBox(
                          child:FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(day.avgtemp),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 6.sp),
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.all(5.sp),
                            padding: EdgeInsets.all(4.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.sp),
                              color: color
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(31.sp),
                                color: Colors.white,
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Image(image: day.weatherstateicon)
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 43,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.sp,bottom: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 55,
                          child: SizedBox(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20.sp),
                                child: Text(day.weatherstate),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 45,
                          child: SizedBox(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(day.date),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}