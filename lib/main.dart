import 'package:flutter/material.dart';
import 'package:flutter_application_2/addEvent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Event Scheduler'),
      // home: AddEvent(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List events = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(21),
          width: double.infinity,
          height: double.infinity,
          color: Colors.deepPurple[300],
          child: events.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      height: 80,
                      child: Stack(children: [
                        Positioned(
                          child: Center(
                            child: Text(
                              events[index][0].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 2,
                            right: 10,
                            child: Text(
                              events[index][1],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.deepPurple,
                              ),
                            ))
                      ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: events.length)
              : Center(
                  child: RichText(
                  text: const TextSpan(
                      style: TextStyle(fontSize: 21),
                      children: <TextSpan>[
                        TextSpan(text: "Click On Button To Add"),
                        TextSpan(
                            text: " Events!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ))
                      ]),
                ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List newEvent = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return AddEvent();
          }));
          setState(() {
            events.add(newEvent);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
