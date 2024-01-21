
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rashydov_pmp_laba_1/weather.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({super.key, required this.city});

  final String city;

  @override
  WeatherDetailScreenState createState() => WeatherDetailScreenState();

}


class WeatherDetailScreenState extends State<WeatherDetailScreen>{

  late Future<WeatherInfo> weatherInfo;

  @override
  void initState() {
    super.initState();

    log("Завантажуємо погоду для міста $widget.city...");
    weatherInfo = fetchWeather(widget.city);
    weatherInfo.then((value) => {
      log("$value")
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Погода для міста " + widget.city),
        ),
        body: Center(
          child: FutureBuilder<WeatherInfo>(
            future: weatherInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Температура: ${snapshot.data!.temperature}, вітер: ${snapshot.data!.wind} ");
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        )
    );
  }
}

