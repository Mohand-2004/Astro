import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ErrorWeatherWidget extends StatelessWidget{
  final String massage;
  const ErrorWeatherWidget({super.key,required this.massage});
  String geticon(){
    if(massage == "No matching location found."){
      return "assets/images/error.png";
    }
    else if(massage == "no weather data"){
      return 'assets/images/quit-icon-11.jpg';
    }
    else{
      return "assets/images/ue.png";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 140.sp,horizontal: 5.sp),
      child: Column(
        children: [
          Expanded(
            flex: 80,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(geticon()),fit: BoxFit.contain)
              ),
            )
          ),
          Expanded(
            flex: 20,
            child: SizedBox(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Text(massage)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}