import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget getWeatherCode(int code){
    switch(code){
      case  >= 200 && < 300 :
        return Image.asset("assets/images/1.png");
      case  >= 300 && < 400 :
        return Image.asset("assets/images/2.png");
      case  >= 500 && < 600 :
        return Image.asset("assets/images/3.png");
      case  >= 600 && < 700 :
        return Image.asset("assets/images/4.png");
      case  >= 700 && < 800 :
        return Image.asset("assets/images/5.png");
      case  == 800 :
        return Image.asset("assets/images/6.png");
      case  > 800 && <= 804 :
        return Image.asset("assets/images/7.png");
      default : return Image.asset("assets/images/7.png");

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(40),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if(state is WeatherSuccess){
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(3, -0.3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-3, -0.3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -1.1),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.orangeAccent),
                      height: 300,
                      width: 300,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 400, sigmaY: 400),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          "📍 ${state.weather.areaName}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Good Morning ,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        Center(child: getWeatherCode(state.weather.weatherConditionCode!)),
                        SizedBox(height: 8),
                        Center(
                          child: Text(
                            "${state.weather.temperature!.celsius!.round()}°C",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.weather.weatherMain!.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd • ').add_jm().format(state.weather.date!),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      /// sunrise image
                                      "assets/images/11.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sunrise",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        /// sunset image
                                        "assets/images/12.png",
                                        height: 60,
                                        width: 60,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sunset",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            DateFormat().add_jm().format(state.weather.sunset!),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey[700],
                              thickness: 0.5,
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      /// temp max image
                                      "assets/images/13.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    SizedBox(width: 3),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Temp Max",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round()}°C",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/14.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    SizedBox(width: 3),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Min Temp",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${state.weather.tempMin!.celsius!.round()}°C",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
