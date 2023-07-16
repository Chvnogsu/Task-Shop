import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<String> categories = [];
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData().then((data) {
      setState(() {
        weatherData = data;
      });
    });
  }

  Future<Map<String, dynamic>> fetchWeatherData() async {
    final apiKey = '65d3cdfa51f79de7126396cde1cfabd6';
    final city = 'Atlanta,GA';

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  void showWeatherDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Weather Information'),
          content: weatherData != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'City: ${weatherData!['name']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Temperature: ${(weatherData!['main']['temp'] - 273.15).toStringAsFixed(1)}°C',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Description: ${weatherData!['weather'][0]['description']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                )
              : CircularProgressIndicator(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void showTaskAddedNotification(String task) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task added: $task'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget weatherCard = weatherData != null
        ? Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Weather in ${weatherData!['name']}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Temperature: ${(weatherData!['main']['temp'] - 273.15).toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Description: ${weatherData!['weather'][0]['description']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          )
        : CircularProgressIndicator();

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(categories[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    categories.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: showWeatherDialog,
              child: Icon(Icons.cloud),
              backgroundColor: Colors.orange,
            ),
            SizedBox(height: 16.0),
            FloatingActionButton(
              onPressed: () {
                _showAddCategoryDialog();
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newCategory = '';
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newCategory = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter task name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  categories.add(newCategory);
                  showTaskAddedNotification(newCategory);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: CategoryListPage(),
    );
  }
}
