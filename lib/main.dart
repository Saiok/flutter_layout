import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  const Divider(),
                  _temperature(),
                  const Divider(),
                  _temperatureForecast(),
                  const Divider(),
                  _footerRatings()
                ],
              ),
            )
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://media.istockphoto.com/photos/weather-forecast-concept-picture-id531889697?b=1&k=20&m=531889697&s=170667a&w=0&h=imZl8VcPhgj-6jTFFkYGbVTFOTyQ-u93Z9WsyhMdqps='),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sodales, mi ut pulvinar laoreet, orci magna lacinia neque, in semper libero sem ut massa. Donec vel tortor orci. Praesent vulputate sem ac finibus posuere. Duis ut sem finibus, hendrerit erat non, iaculis eros.',
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      const SizedBox(width: 16,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('15* Clear', style: TextStyle(color: Colors.deepPurple),)
            ],
          ),
          Row(
            children: const [
              Text('Almaty oblysy, Almaty', style: TextStyle(color: Colors.grey),)
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text('${index + 20} *C', style: const TextStyle(fontSize: 15),),
        avatar: const Icon(Icons.cloud, color: Colors.lightBlue,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      Icon(Icons.star, size: 15, color: Colors.yellow[600],),
      const Icon(Icons.star, size: 15, color: Colors.black,),
      const Icon(Icons.star, size: 15, color: Colors.black,),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Info with openweathermap.org', style: TextStyle(fontSize: 15),),
      stars
    ],
  );
}
