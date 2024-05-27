import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InfoWidget extends StatelessWidget{
  final Widget icon;
  final String lable;
  const InfoWidget({super.key,required this.icon,required this.lable,required});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: icon,
          ),
          const Expanded(flex: 5,child: SizedBox()),
          Expanded(
            flex: 75,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(lable),
            ),
          )
        ],
      ),
    );
  }
}
class AstroInfoWidget extends StatelessWidget{
  final String imagepath;
  final String event;
  final String time;
  const AstroInfoWidget({super.key,required this.imagepath,required this.event,required this.time});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imagepath)
                )
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Padding(
              padding: EdgeInsets.only(left: 8.sp,top: 3.sp,bottom: 3.sp),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 50,
                      child: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(event),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(time),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}