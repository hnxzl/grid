import 'package:flutter/material.dart';

void main() {
  runApp(NamaList());
}

class NamaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Nama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NamaListSiapa(), 
    );
  }
}

class NamaListSiapa extends StatelessWidget {
  final List<String> gridItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  final List<String> listItems = [
    'Aku',
    'Anak',
    'Sehat',
    'Tubuhku',
    'Kuat',
    'Karena',
    'Mama',
    'Memberi',
    'Sakatonik',
    'ABC'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Page (+ Horizontal List)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: gridItems.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      gridItems[index],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.all(8),
                  color: Colors.tealAccent,
                  child: Center(
                    child: Text(
                      listItems[index],
                      style: TextStyle(fontSize: 18),
                    ),
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
