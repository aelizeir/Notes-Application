import 'package:application_1/homepage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:application_1/db/todo_database.dart';
import 'package:application_1/model/todo.dart';
import 'package:application_1/page/add_edit_todo_page.dart';
import 'package:application_1/page/todo_detail_page.dart';
import 'package:application_1/widget/todo_card_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late List<Todo> todo;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    TodoDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    todo = await TodoDatabase.instance.readAllTodos();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // appBar: AppBar(
    //   title: const Text(
    //     'Notes',
    //     style: TextStyle(
    //         fontSize: 24,
    //         color: Colors.black54,
    //         fontWeight: FontWeight.bold
    //     ),
    //   ),
    // ),
    body: Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : todo.isEmpty
          ? const Text(
        'No Notes',
        style: TextStyle(color: Colors.grey, fontSize: 24),
      )
          : buildTodo(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      child: const Icon(Icons.edit_note_sharp, ),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditTodoPage()),
        );

        refreshNotes();
      },
    ),
  );

  Widget buildTodo() => ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: todo.length,
      itemBuilder: (context, index) {
        final todos = todo[index];
        return GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TodoDetailPage(todoId: todos.id!),
            ));

            refreshNotes();
          },
          child: TodoCardWidget(todo: todos, index: index),
        );
      }
  );

  //     StaggeredGridView.countBuilder(
  //   padding: const EdgeInsets.all(8),
  //   itemCount: todo.length,
  //   staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
  //   crossAxisCount: 4,
  //   mainAxisSpacing: 4,
  //   crossAxisSpacing: 4,
  //   itemBuilder: (context, index) {
  //     final todos = todo[index];
  //
  //     return GestureDetector(
  //       onTap: () async {
  //         await Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => TodoDetailPage(todoId: todos.id!),
  //         ));
  //
  //         refreshNotes();
  //       },
  //       child: TodoCardWidget(todo: todos, index: index),
  //     );
  //   },
  // );
}