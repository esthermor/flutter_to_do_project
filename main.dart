import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> title = <String>[];
  final List<String> description = <String>[];
  // final myController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  // TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void addItemToList(){
    setState(() {
      title.insert(0,titleController.text);
      description.insert(0,descriptionController.text);
      titleController.clear();
      descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Project'),
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'Title',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'Description',
                  ),
                ),
              ),

              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: title.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.purpleAccent,
                          
                          // height: 60,
                          margin: EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text('${title[index]} ',
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                    ),Text(' ${description[index]}',
                                      style: TextStyle(fontSize: 20),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              )
                          ),
                        );
                      }
                  )
              )

            ]
        ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () => {
      addItemToList(),
      }
    ),
    );
  }
}