import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [Expanded(child: _exampleListviewSeparated())],
        ),
      ),
    );
  }

  Widget _exampleListview() {
    return ListView(
      children: [
        Text("List item 1"),
        Text("List item 2"),
        Text("List item 3"),
      ],
    );
  }

  Widget _exampleListviewBuilder() {
    List<String> movies = ["Avatar", "Iron man", "Ring of power"];

    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.access_time),
              ),
              title: Text(movies[index]));
        });
  }

  Widget _exampleListviewSeparated() {
    List<String> movies = [
      "Avatar",
      "Iron man",
      "Ring of power",
      "Hulk",
      "Captain America",
      "KGF",
      "Other",
      "Other",
      "Other",
      "Other",
      "Other"
    ];
    return ListView.separated(
        itemCount: movies.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.access_time),
              ),
              title: Text(movies[index]));
        });
  }

  Widget _exampleListviewCustom() {
    return ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
      (context, index) {
        return ListTile(title: Text("Custom Item \$index"));
      },
      childCount: 10,
    ));
  }
}
