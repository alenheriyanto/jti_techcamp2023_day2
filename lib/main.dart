import 'package:flutter/material.dart';
import 'package:techcamp_day2/model/mobil.dart';
import 'package:techcamp_day2/model/todo.dart';
import 'package:techcamp_day2/second_page.dart';
import 'package:techcamp_day2/third_page.dart';
import 'package:techcamp_day2/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Halaman Satu"),
      routes: {
        "home": (context) => const MyHomePage(title: "Halaman Satu"),
        "second": (context) => const SecondPage(),
        "third": (context) => const ThirdPage()
      },
    );
  }
}

Map notifikasi = {"msg": "Halo stock ada", "page": "second"};

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Mobil mobil =
      Mobil(merek: "Toyota", tipe: "Rush", warna: "Silver", noMesin: 123);
  String merek = "Toyota";

  Map mobilMap = {
    "merek": "Honda",
    "tipe": "Brio",
    "warna": "Merah",
    "noMesin": 321
  };

  ToDo? selectedToDO;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // init();
    // TODO: implement initState
    super.initState();
  }

  Future init() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, notifikasi["page"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Merek ${mobil.merek}"),
            Text("Tipe ${mobil.tipe}"),
            Text("Warna ${mobil.warna}"),
            Text("No. Mesin ${mobil.noMesin}"),
            const SizedBox(
              height: 32,
            ),
            Text("Merek ${mobilMap['mereks']}"),
            Text("Tipe ${mobilMap['tipe']}"),
            Text("Warna ${mobilMap['warna']}"),
            Text("No. Mesin ${mobilMap['noMesin']}"),
            const SizedBox(
              height: 32,
            ),
            Text(
              mobil.showDetails(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 32,
            ),
            mobil.details(),
            const SizedBox(
              height: 32,
            ),
            selectedToDO != null ? Text(selectedToDO!.title) : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var route = MaterialPageRoute(
            builder: (context) => const ToDoPage(),
          );

          var result = await Navigator.push(context, route);

          if (result != null) {
            setState(() {
              selectedToDO = result;
            });
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
