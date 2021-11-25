import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot organizer',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyAppClass(),
    );
  }
}

class MyAppClass extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppClass> {

  void addNewSubject() {
    var predmet = predmetController.text;
    var datum = datumController.text;

    var polaganje = {
      'predmet': predmet,
      'termin': datum,
    };

    setState(() {
      elements.add(polaganje);
    });
  }

  final predmetController = TextEditingController();
  final datumController = TextEditingController();

  List<Map<String, String>> elements = [];

  _MyAppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slot Organizer"),
        actions: [
          IconButton(
            onPressed: () => addNewSubject(),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Vnesi predmet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ime na predmet',
                    ),
                    controller: predmetController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Datum na polaganje',
                    ),
                    controller: datumController,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: elements.length,
              itemBuilder: (contx, index) {
                return Card(
                  elevation: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          elements[index]['predmet'] as String,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Theme
                                .of(contx)
                                .primaryColorDark,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          elements[index]['termin'] as String,
                          style: const TextStyle(
                              color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
