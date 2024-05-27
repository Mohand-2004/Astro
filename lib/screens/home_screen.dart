import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/day%20details%20cubit/day_details_cubit.dart';
import 'package:weather_app/cubits/day%20details%20cubit/states.dart';
import 'package:weather_app/widgets/main_weather_data.dart';
import '/widgets/error_weather_widget.dart';
TextEditingController maincontroller = TextEditingController();
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity,MediaQuery.of(context).size.height/15.5,),
        child: BlocBuilder<DayDetailsCubit,WeatherState>(
          builder: (context, state) {
            return AppBar(
              backgroundColor: state.color,
              title: Row(
                children: [
                  const Expanded(flex: 1,child: SizedBox()),
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
                          controller: maincontroller,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () async {
                                BlocProvider.of<DayDetailsCubit>(context).search(maincontroller.text);
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
                            maincontroller.text = '';
                          }
                        )
                      )
                    )
                  ),
                  const Expanded(flex: 1,child: SizedBox())
                ],
              )
            );
          }
        )
      ),
      body: BlocBuilder<DayDetailsCubit,WeatherState>(
        builder: (context,state){
          if(state is NoWeatherSate){
            return const ErrorWeatherWidget(massage: "no weather data");
          }
          else if(state is MainWeatherDataState){
            return MainWeatherData(days: state.days,color: state.color,);
          }
          else if(state is WeatherErrorState){
            return ErrorWeatherWidget(massage: state.massage);
          }
          else{
            return const ErrorWeatherWidget(massage: "Unexpected Error!");
          }
        },
      ),
    );
  }
}