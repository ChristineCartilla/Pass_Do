import 'package:flutter/material.dart';
import 'package:pass_do/Screens/Home/admin/components/a_sidebar.dart';
import 'package:pass_do/Screens/Home/admin/subcomponent/a_userItem.dart';
import 'package:pass_do/constant.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminUsersList extends StatefulWidget {
  static String routeName = "/adminuserlist";

  final String? title;
  const AdminUsersList({super.key, this.title});

  @override
  State<AdminUsersList> createState() => _AdminUsersListState();
}

class _AdminUsersListState extends State<AdminUsersList> {
  List<Workload> _workload = <Workload>[];
  late WorkloadDataSource _workloadDataSource;

  @override
  void initState() {
    super.initState();
    _workload = getWorkloadData();
    _workloadDataSource = WorkloadDataSource(_workload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF277BC0),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          //margin: EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Text(
                      "UserList",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    /*ElevatedButton(
                        onPressed: () {
                          _dialogBuilder(context);
                        },
                        child: const Icon(Icons.add)),
                    const SizedBox(
                      width: 10,
                    ),*/
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SfDataGrid(
                source: _workloadDataSource,
                columns: [
                  GridColumn(
                    columnName: 'Id',
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: const Text('ID'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Name',
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: const Text('Name'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Status',
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: const Text('Status'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'button',
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      //child: const Text('Details '),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Workload> getWorkloadData() {
    return [
      Workload(10001, 'User1', 'Active'),
      Workload(10002, 'User2', 'Active'),
      Workload(10003, 'User3', 'Active'),
      Workload(10004, 'User4', 'Active'),
      Workload(10005, 'User5', 'Active'),
    ];
  }
}

class WorkloadDataSource extends DataGridSource {
  WorkloadDataSource(List<Workload> workload) {
    buildDataGridRow(workload);
  }

  void buildDataGridRow(List<Workload> workloadData) {
    dataGridRow = workloadData.map<DataGridRow>((workload) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'Id', value: workload.id),
        DataGridCell<String>(columnName: 'Name', value: workload.name),
        DataGridCell<String>(columnName: 'Status', value: workload.status),
        const DataGridCell<Widget>(columnName: 'button', value: null),
      ]);
    }).toList();
  }

  List<DataGridRow> dataGridRow = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRow.isEmpty ? [] : dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.center,
          child: dataGridCell.columnName == 'button'
              ? LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context, UserItem.routeName,
                        //arguments: ScreenArguments()
                      );
                    },
                    child: const Text('Details'),
                  );
                })
              : Text(dataGridCell.value.toString()));
    }).toList());
  }
}

class Workload {
  Workload(this.id, this.name, this.status);
  final int id;
  final String name;
  final String status;
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      final _formKey = GlobalKey<FormState>();
      return AlertDialog(
        title: const Text('Add New User'),
        content: Stack(
          // overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First name',
                              hintText: 'Enter your first name',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                return "Invalid name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Expanded(
                          child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Last name',
                                hintText: 'Enter your last name',
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                  return "Invalid name";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                                    .hasMatch(value)) {
                              return "Invalid email address";
                            } else {
                              return null;
                            }
                          })),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Contact No.',
                                hintText: 'Enter your phone number',
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                        .hasMatch(value)) {
                                  return "Invalid phone number";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Organization',
                                hintText: 'Enter your organization',
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                  return "Invalid organization";
                                } else {
                                  return null;
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Column()

                        child: ElevatedButton(
                          child: const Text("Add"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //_formKey.currentState.save();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Column()

                        child: ElevatedButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[],
      );
    },
  );
}
