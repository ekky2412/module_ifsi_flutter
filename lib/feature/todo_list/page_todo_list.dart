import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_ifsi_flutter/model/todolist_model.dart';
import 'package:module_ifsi_flutter/view/common_submit_button.dart';

class PageTodoList extends StatefulWidget {
  const PageTodoList({
    Key? key,
  }) : super(key: key);

  @override
  _PageTodoListState createState() => _PageTodoListState();
}

class _PageTodoListState extends State<PageTodoList> {
  Box<TodoListModel> localDBBox = Hive.box<TodoListModel>("todolist");

  TextEditingController fieldInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
      ),
      body: Container(
        child: Column(
          children: [
            _buildInputField(),
            _buildButtonSubmit(),
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return TextFormField(
      controller: fieldInputController,
    );
  }

  Widget _buildButtonSubmit() {
    return CommonSubmitButton(
      labelButton: "Simpan",
      submitCallback: (value) {
        print("Field Value ${fieldInputController.text}");
        if (fieldInputController.text.isNotEmpty) {
          localDBBox.add(TodoListModel(action: fieldInputController.text));
          fieldInputController.clear();
          setState(() {});
        }
      },
    );
  }

  Widget _buildList() {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: localDBBox.listenable(),
        builder: (BuildContext context, Box<dynamic> value, Widget? child) {
          if (value.isEmpty) {
            return Center(
              child: Text("Data Kosong"),
            );
          }

          return ListView.builder(
            itemCount: localDBBox.length,
            itemBuilder: (BuildContext context, int index) {
              return Text("${localDBBox.getAt(index)}");
            },
          );
        },
      ),
    );
  }
}
