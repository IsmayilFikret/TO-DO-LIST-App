import 'dart:ffi';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  List<String> item = [];

  void addItemToList() {
    setState(() {
      if (controller.text == '') {
        return;
      } else {
        item.add(controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              addItemToList();
            },
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ],
        title: TextField(
          controller: controller,
          decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'add text',
              hintStyle: TextStyle(fontSize: 20)),
        ),
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                item.removeAt(index);
              });
            },
            child: Card(
              child: ListTile(
                title: Text(item[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
