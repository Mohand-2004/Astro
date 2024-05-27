import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/day_model.dart';
import 'package:weather_app/widgets/day_widget.dart';
import '/screens/detailes_screen.dart';
class MainWeatherData extends StatelessWidget{
  final List<Day> days;
  final Color color;
  const MainWeatherData({super.key,required this.days,required this.color});
  @override
  Widget build(BuildContext context){
    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: SizedBox(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 5.sp),
                    child: Text(
                      days[0].location
                    ),
                  ),
                ),
              )
            ),
            Divider(
              indent: 40.sp,
              endIndent: 40.sp,
              color: Colors.grey,
            ),
            Expanded(
              flex: 52, // today container
              child: Container(
                margin: EdgeInsets.all(4.sp),
                padding: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(13.sp)
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context) {
                        return DetailedScreen(day: days[0],color: color);
                      },
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.sp),
                      child: Column(
                        children: [
                          const Expanded(flex: 4,child: SizedBox()),
                          Expanded(
                            flex: 40,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  const Expanded(flex: 1,child: SizedBox()),
                                  Expanded(
                                    flex: 25,
                                    child: Container(
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
                                            child: Image(image: days[0].weatherstateicon)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    flex: 22,
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(flex: 5,child: SizedBox()),
                                          Expanded(
                                            flex: 50,
                                            child: SizedBox(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(days[0].avgtemp),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 34,
                                            child: SizedBox(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.sp),
                                                  child: Text(days[0].weatherstate),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Expanded(flex: 11,child: SizedBox()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 16,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Expanded(flex: 10,child: SizedBox()),
                                        Expanded(
                                          flex: 50,
                                          child: SizedBox(
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Padding(
                                                padding: EdgeInsets.all(6.sp),
                                                child: Text("max ${days[0].maxtemp}\nmin ${days[0].mintemp}"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Expanded(flex: 40,child: SizedBox()),
                                      ],
                                    )
                                  ),
                                  const Expanded(flex: 2,child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(flex: 1,child: SizedBox()),
                          Expanded(
                            flex: 30,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.transparent,
                              child:Padding(
                                padding: EdgeInsets.only(left: 20.sp,top: 20.sp),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 60,
                                      child: SizedBox(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(days[0].date),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 40,
                                      child: SizedBox(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text("last updated ${days[0].updatedtime}"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                          const Expanded(flex: 9,child: SizedBox())
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child:SizedBox(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 2.sp,bottom: 2.sp),
                    child: const Text("Next Days"),
                  ),
                ),
              )
            ),
            Expanded(
              flex: 52,
              child: Container(
                margin: EdgeInsets.all(4.sp),
                padding: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(13.sp)
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 5.sp,bottom: 5.sp,left: 5.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: ListView.builder(itemBuilder: (context,index){
                      return DayWidget(day: days[index+1],color: color);
                    },
                    itemCount: (days.length)-1,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}