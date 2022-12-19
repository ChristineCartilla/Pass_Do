import 'package:flutter/material.dart';
import 'package:pass_do/constant.dart';

class UserItem extends StatefulWidget {
  static String routeName = "/useritem";
  const UserItem({super.key});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryLightColor,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Brian Grey",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          _dialogBuilder(context);
                        },
                        heroTag: 'update',
                        elevation: 0,
                        label: const Text("Update"),
                        icon: const Icon(Icons.create),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {
                          _dialogDelete(context);
                        },
                        heroTag: 'delete',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Delete"),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "shadesofgrey@gmail",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            "Email Address",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "09876543219",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            "Contact",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Organization", "MovieStud"),
    ProfileInfoItem("Role", "User"),
    ProfileInfoItem("Status", "Active"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final String value;

  const ProfileInfoItem(
    this.title,
    this.value,
  );
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1598259748527-7bc30d303043?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      final _formKey = GlobalKey<FormState>();
      return AlertDialog(
        title: const Text('Edit User'),
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
                          child: const Text("Update"),
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
      );
    },
  );
}

Future<void> _dialogDelete(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Continue to delete user?'),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Column()

                child: ElevatedButton(
                  child: const Text("Delete"),
                  onPressed: () {},
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
      );
    },
  );
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    //backgroundColor: const Color(0xFF277BC0),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      // ignore: prefer_const_constructors
      icon: Icon(
        Icons.arrow_back_ios,
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}
