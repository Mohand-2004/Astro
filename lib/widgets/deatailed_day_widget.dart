import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/day_model.dart';
import 'package:weather_app/widgets/hour_widget.dart';
import 'package:weather_app/widgets/weather_info_widgets.dart';
class DetailedDayWidget extends StatelessWidget{
  final Day day;
  final Color color;
  const DetailedDayWidget({super.key,required this.day,required this.color});
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(5.sp),
      padding: EdgeInsets.all(3.sp),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.sp)
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17.sp)
        ),
        child: Column( // main column
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(  // day info container
              flex: 56,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(  // city and temp info
                      flex: 30,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 67,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(day.location),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text("\t${day.date}"),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text("\tmax ${day.maxtemp}\t\t\t\t\t\t\tmin ${day.mintemp}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(flex: 5,child: SizedBox()),
                            Expanded(
                              flex: 40,
                              child: Padding(
                                padding: EdgeInsets.only(right: 12.sp),
                                child: SizedBox(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(day.avgtemp),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Divider(
                      indent: 40.sp,
                      endIndent: 40.sp,
                      height: 20,
                      color: Colors.grey,
                    ),
                    Expanded(  // days weather and astro info
                      flex: 67,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Expanded(  // days weather info
                              flex: 45,
                              child: Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: SizedBox(   
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 25,
                                        child: InfoWidget(icon: const Icon(Icons.remove_red_eye_rounded), lable: "Visabality : ${day.visability}"),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: InfoWidget(icon: const Image(image: AssetImage('assets/images/Weather-Rain-icon.png')), lable: "rain chance : ${day.rainchane}"),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: InfoWidget(icon: const Image(image: AssetImage('assets/images/snow.jpg')), lable: "snow chance : ${day.snowchane}"),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: InfoWidget(icon: const Image(image: AssetImage('assets/images/wind.png')), lable: "wind speed : ${day.windspeed}"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(  // astro container
                              flex: 55,
                              child: Container(
                                margin: EdgeInsets.all(4.sp),
                                padding: EdgeInsets.all(3.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.sp),
                                  color: color,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.white
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 3.sp),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 25,
                                          child: AstroInfoWidget(imagepath: "assets/images/sunrise.png",event: 'sunrise',time: day.sunrisetime),
                                        ),
                                        Divider(
                                          indent: 30.sp,
                                          endIndent: 30.sp,
                                          height: 2.sp,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                          flex: 25,
                                          child: AstroInfoWidget(imagepath: "assets/images/sunset.png",event: 'sunset',time: day.sunsettime),
                                        ),
                                        Divider(
                                          indent: 30.sp,
                                          endIndent: 30.sp,
                                          height: 2.sp,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                          flex: 25,
                                          child: AstroInfoWidget(imagepath: "assets/images/546464.png",event: 'moonrise',time: day.moonrisetime),
                                        ),
                                        Divider(
                                          indent: 30.sp,
                                          endIndent: 30.sp,
                                          height: 2.sp,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                          flex: 25,
                                          child: AstroInfoWidget(imagepath: "assets/images/images.png",event: 'moonset',time: day.moonsettime),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Expanded(flex: 3,child: SizedBox()),
                  ],
                ),
              )
            ),
            Divider(
              indent: 40.sp,
              endIndent: 40.sp,
              height: 5,
              color: Colors.grey,
            ),
            Expanded( // hourly detailes widget
              flex: 8,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.sp,top: 2.sp,bottom: 3.sp),
                  child: const Text("hourly detailes"),
                ),
              ),
            ),
            Expanded(  // hours listview
              flex: 36,
              child: Container(
                margin: EdgeInsets.all(4.sp),
                padding: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(13.sp)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                        child: HourWidget(hour: day.hours[index],color: color),
                      );
                    },
                    itemCount: day.hours.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}