import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  List<String> item = [];

  void addItemToList() {
    setState(() {});
    item.add(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppBar(
          title: const Text('To-Do App'),
        ),
      ),
      appBar: _MyAppBar(),
      body: _Body(),
    );
  }

  AppBar _MyAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 32,
          ),
        ),
        IconButton(
          onPressed: () {
            if (controller.text == '') {
              return;
            } else {
              addItemToList();
            }

            controller.text = '';
          },
          icon: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ],
      title: Text('To-Do App'),
    );
  }

  Column _Body() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return InkWell(
                onDoubleTap: () {
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
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'add text',
              hintStyle: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
