import 'package:flutter/material.dart';
import 'package:to_do_list/empty_screen.dart';
import 'package:to_do_list/to_do_entity.dart';
import 'package:to_do_list/bottomsheet.dart';
import 'package:to_do_list/to_do_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todolist',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = '태현';

  List<ToDoEntity> list = [];

  void toggleFavorite(int index) {
    setState(() {
      list[index].isFavorite = !list[index].isFavorite;
    });
  }

  void toggleDone(int index) {
    setState(() {
      list[index].isDone = !list[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "$name's Tasks",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body:
          list.isEmpty
              ? EmptyScreen(name)
              : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ToDoview(
                    toDo: list,
                    onToggleDone: () {
                      toggleDone(index);
                    },
                    onToggleFavorite: () {
                      toggleFavorite(index);
                    },
                    index: index,
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Bottomsheet(),
          );
          final String title = result['title'] ?? '할 일 ${list.length + 1}';
          final String description = result['description'] ?? '세부내용을 입력해주세요';
          final bool isFavorite = result['isFavorite'] ?? false;
          final bool isDone = false;

          if (title.isNotEmpty) {
            setState(() {
              list.add(
                ToDoEntity(
                  title: title,
                  description: description,
                  isFavorite: isFavorite,
                  isDone: isDone,
                ),
              );
            });
          }
        },
        shape: CircleBorder(),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        child: Icon(Icons.add, size: 24),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
