import 'package:flutter/material.dart';

void main() {
  runApp(SearchApp());
}

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absen Nama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NamaList(),
    );
  }
}

class NamaList extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<NamaList> {
  TextEditingController searchController = TextEditingController();
  List<String> originList = [
    "Ahmad Zaenal",
    "Saiful Anam",
    "Vincent",
    "Noufal",
    "Mikail",
    "Eben",
    "Nurul",
    "Anissa",
    "Bunga",
    "Evi",
    "raihan",
    "putra",
    "Dzikri",
    "Uray",
    "Yogi"
  ];
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = originList;
    searchController.addListener(() {
      filterList();
    });
  }

  void filterList() {
    setState(() {
      String keyword = searchController.text.toLowerCase();
      filteredList = originList
          .where((nama) => nama.toLowerCase().contains(keyword))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
