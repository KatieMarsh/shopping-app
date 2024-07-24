import 'package:flutter/material.dart';
void main() {
  runApp(
    const Quiz2Sec4(),
  );
}

class Quiz2Sec4 extends StatefulWidget {
  const Quiz2Sec4({super.key});
  @override
  State<Quiz2Sec4> createState() => _Quiz2Sec4State();
}

class _Quiz2Sec4State extends State<Quiz2Sec4> {
  List todo = [
    {'name': 'exam', 'date': '5/5/2023'},
    {'name': 'shopping', 'date': '7/5/2023'},
    {'name': 'party', 'date': '20/5/2023'},
  ];
  List done = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Todo list'),
              Expanded(
                  flex: 45,
                  child: ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todo[index]['name']),
                        subtitle: Text("Due: ${todo[index]['date']}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: () {
                            setState(() {
                              done.add(todo[index]);
                              print(done.length);
                              todo.remove(todo[index]);
                            });
                          },
                        ),
                      );
                    },
                  )),
              Divider(),
              const Text('Done'),
              Expanded(
                  flex: 45,
                  child: ListView.builder(
                    itemCount: done.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(done[index]['name']),
                        subtitle: Text("Due: ${done[index]['date']}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              todo.add(done[index]);
                              print(done.length);
                              done.remove(done[index]);
                            });
                          },
                        ),
                      );
                    },
                  )),
              Expanded(
                  flex: 10,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(),
                            settings: RouteSettings(arguments: {
                              'todo': todo.length,
                              'done': done.length
                            }),
                          ),
                        );
                      },
                      child: Text('Check')))
            ],
          ),
        ),
      ),
    );
  }
}

// =============== Summary page ===========
class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("Todo = ${data['todo']} items"),
              Text("Done = ${data['done']} items")
            ],
          ),
        ),
      ),
    );
  }
}
