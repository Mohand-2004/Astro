import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/day%20details%20cubit/day_details_cubit.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/widgets/deatailed_day_widget.dart';
import '/models/day_model.dart';
// ignore: must_be_immutable
class DetailedScreen extends StatelessWidget{
  final Day day;
  final Color color;
  DetailedScreen({super.key,required this.day,required this.color});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height/15.5,
        backgroundColor: color,
        title: Row(
          children: [
            const Expanded(
              flex: 29,
              child: SizedBox(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Weather',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ),
            Expanded(
              flex: 69,
              child: Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 12,left: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          BlocProvider.of<DayDetailsCubit>(context).search(controller.text);
                          Navigator.pop(context);
                          maincontroller.text = '';
                        },
                        icon: const Icon(Icons.search_rounded),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search City",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      )
                    ),
                    onSubmitted: (value) async {
                      BlocProvider.of<DayDetailsCubit>(context).search(value);
                      Navigator.pop(context);
                      maincontroller.text = '';
                    }
                  )
                )
              )
            ),
            const Expanded(flex: 1,child: SizedBox())
          ],
        )
      ),
      body: DetailedDayWidget(day: day,color: color)
    );
  }
}