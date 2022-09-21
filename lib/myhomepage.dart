import 'package:apps/class.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _namecontroller;
  late TextEditingController _jobcontroller;

  late List<model> listPeople = [];
  @override
  void initState() {
    super.initState();
    _jobcontroller = TextEditingController();
    _namecontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: Text(
                        listPeople[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Text(
                        listPeople[index].job,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: listPeople.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomsheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> bottomsheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 10,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 250,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      TextField(
                        controller: _namecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          labelText: 'NAME',
                          hintText: "name",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _jobcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          labelText: 'JOB',
                          hintText: "JOB",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            listPeople.add(model(
                                name: _namecontroller.text,
                                job: _jobcontroller.text));
                            print(listPeople[0].job);

                            setState(() {
                              _namecontroller.clear();
                              _jobcontroller.clear();
                              listPeople;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.add))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
