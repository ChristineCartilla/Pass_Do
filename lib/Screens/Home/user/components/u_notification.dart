import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Home/user/components/subcomponent/additional_information.dart';
import 'package:pass_do/Screens/Home/user/components/subcomponent/current_weather.dart';
import 'package:pass_do/Screens/Home/user/components/subcomponent/weather_model.dart';
import 'package:pass_do/Screens/Home/user/components/u_sidebar.dart';
import 'package:pass_do/Screens/Home/user/dynamic_event.dart';
import 'package:pass_do/Services/weather_api_client.dart';
import 'package:pass_do/constant.dart';

class Notifications extends StatefulWidget {
  static String routeName = "/notifications";
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async {
    data = await client.getCurrentWeather("Cebu");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF277BC0),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              DynamicEvent(),

              FutureBuilder(
                future: getData(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        currentWeather(Icons.wb_cloudy_rounded,
                            "${data!.temp}°", "${data!.cityName}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Additional Information",
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        additionalInformation(
                            "${data!.wind}",
                            "${data!.humidity}",
                            "${data!.pressure}",
                            "${data!.feels_like}"),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                }),
              )
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     currentWeather(Icons.wb_sunny_rounded, "26.3", "Cebu"),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       "Additional Information",
              //       style: TextStyle(
              //           fontSize: 24.0,
              //           color: Colors.black45,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     Divider(),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     additionalInformation("24.0", "2.0", "1014.0", "24.6")
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 30,
        ),
        Image.asset(
          "assets/images/Heading.png",
          height: 35,
        ),
      ],
    ),
  );
}
