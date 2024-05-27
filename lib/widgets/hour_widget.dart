import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/models/hour_model.dart';
class HourWidget extends StatelessWidget{
  final Hour hour;
  final Color color;
  const HourWidget({super.key,required this.hour,required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width/1.37,
      margin: EdgeInsets.all(4.sp),
      padding: EdgeInsets.all(3.sp),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13.sp)
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.sp)
        ),
        child: Column(
          children: [
            Expanded(
              flex: 45,
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child: Container(
                        margin: EdgeInsets.all(4.sp),
                        padding: EdgeInsets.all(3.sp),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(25.sp)
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.sp),
                            image: DecorationImage(
                              image: hour.weatherstateicon
                            )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.sp),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 57,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(hour.time)
                                ),
                              ),
                              Expanded(
                                flex: 38,
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(hour.weatherstate)
                                        )
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Padding(
                                            padding: EdgeInsets.all(5.sp),
                                            child: Text('\t${hour.temp}'),
                                          )
                                        )
                                      ),
                                    ],
                                  ),
                                )
                              ),
                              const Expanded(flex: 5,child: SizedBox(),)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
              height: 5,
            ),
            Expanded(
              flex: 55,
              child: Padding(
                padding: EdgeInsets.only(bottom: 3.sp,top: 1.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 25,
                      child: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text('visabilty : ${hour.visability}'),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 25,
                      child: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text('snow chance : ${hour.snowchane}'),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 25,
                      child: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text('rain chance : ${hour.rainchane}'),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 25,
                      child: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text('wind speed : ${hour.windspeed}'),
                        ),
                      )
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}