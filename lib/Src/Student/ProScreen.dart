import 'package:flutter/material.dart';
import 'GeneraL_Pro.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({Key? key}) : super(key: key);

  @override
  _ProScreenState createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  List<Student> _users = [
    Student(
        'Elliana Palacios',
        '@elliana',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    Student(
        'Kayley Dwyer',
        '@kayley',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    Student(
        'Kathleen Mcdonough',
        '@kathleen',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    Student(
        'Kathleen Dyer',
        '@kathleen',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    Student(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    Student(
        'Kiersten Lange',
        '@kiersten',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    Student(
        'Carys Metz',
        '@metz',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    Student(
        'Ignacio Schmidt',
        '@schmidt',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    Student(
        'Clyde Lucas',
        '@clyde',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    Student(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  List<Student> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () => _showMaterialDialog(context),
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          )),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search users"),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: _foundedUsers.length > 0
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: userComponent(student: _foundedUsers[index]),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.transparent,
                        icon: Icons.archive,
                        onTap: () => print("archive"),
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.transparent,
                        icon: Icons.share,
                        onTap: () => print('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.transparent,
                        icon: Icons.more_horiz,
                        onTap: () => print('More'),
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        icon: Icons.delete,
                        onTap: () => print('Delete'),
                      ),
                    ],
                  );
                })
            : Center(
                child: Text(
                "No users found",
                style: TextStyle(color: Colors.white),
              )),
      ),
    );
  }

  userComponent({required Student student}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(student.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(student.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(student.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                student.isFollowedByMe = !student.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: student.isFollowedByMe
                        ? Colors.blue[700]
                        : Color(0xffffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: student.isFollowedByMe
                          ? Colors.transparent
                          : Colors.grey.shade700,
                    )),
                child: Center(
                    child:
                        TextButton(onPressed: () {}, child: Text('Follow')))),
          )
        ],
      ),
    );
  }

  void _showMaterialDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Create New Student Pro'),
            backgroundColor: Colors.white,
            children: [
              Form(
                  child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Name',
                      hintText: 'Full Name',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.alternate_email_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Name',
                      hintText: 'Full Name',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.alternate_email_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000, 1, 1),
                          lastDate: DateTime(2020, 12, 30));
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Date',
                      hintText: 'Date Time',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Icons.alternate_email_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          );
        });
  }
}
