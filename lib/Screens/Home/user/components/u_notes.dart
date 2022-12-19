import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Home/user/components/u_sidebar.dart';
import 'package:pass_do/constant.dart';

class NotesPage extends StatefulWidget {
  static String routeName = "/notes";
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  String input = " ";
  List note = [];
  @override
  void initState() {
    note.add("Pick trash");
    note.add("Get new equipment");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    return Scaffold(
        drawer: const NavigationDrawerWidget(),
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF277BC0),
        appBar: buildAppBar(context),
        floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryLightColor,
            child: Icon(
              Icons.add,
              color: kPrimarybuttonColor,
              size: 35,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add Note"),
                    content: TextField(
                      decoration: InputDecoration(hintText: "Enter Note"),
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            note.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
        body: Padding(
          padding: EdgeInsets.all(2),
          child: ListView.builder(
              itemCount: note.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(note[index]),
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        title: Text(note[index],
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.green),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Edit Note"),
                                        content: TextField(
                                          decoration: InputDecoration(
                                              hintText: note[index]),
                                          onChanged: (String value) {
                                            input = value;
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                note[index] = input;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "EDIT",
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_forever_rounded,
                                    color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    note.removeAt(index);
                                  });
                                },
                              ),
                            ]),
                      ),
                    ));
              }),
        ));
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 30,
        ),
        Image.asset(
          "assets/images/Heading.png",
          height: 35,
        ),
      ],
    ),
  );
}
