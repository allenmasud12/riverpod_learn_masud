import 'package:flutter/material.dart';
import 'package:riverpod_learn_masud/features/04_state_notifier_provider_dtodo/models/todo_model.dart';
import 'package:riverpod_learn_masud/features/04_state_notifier_provider_dtodo/states/todo_state.dart';
import 'package:riverpod_learn_masud/widgets/m_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoScreen extends ConsumerWidget {
  final String title;
  const TodoScreen(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return MScaffold(
      title: title,
      body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              Todo todo = todoList[index];
              return ListTile(
                title: Text(todoList[index].title),
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  // 3
                  onPressed: () {
                    todo.title = 'Updated Title';
                    ref.read(todoListProvider.notifier).edit(todo);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  // 3
                  onPressed: () =>
                      ref.read(todoListProvider.notifier).remove(todo.id),
                ),
              );
            },
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => ref.read(todoListProvider.notifier).add('New Item'),
      ),
    );
  }

}
