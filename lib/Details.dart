import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/Homepage.dart';
import 'package:qualifflutter/Item.dart';
import 'package:qualifflutter/Itemm.dart';
import 'package:qualifflutter/Login.dart';
import 'package:qualifflutter/Review.dart';
import 'package:qualifflutter/Theme.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  Itemm item;
  String email;
  Details({super.key, required this.item, required this.email});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController commentController = TextEditingController();
  var reviews = [
    Review(review: "Nice Product", email: "elsa@gmail.com"),
    Review(review: "Great", email: "romeo_11@gmail.com"),
    Review(review: "Recommended product", email: "jeremyjas01@gmail.com")
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(child: Text("Watson")),
                Card(
                  child: widget.email != null
                      ? ListTile(title: Text(widget.email))
                      : ListTile(title: const Text("profile")),
                ),
                Card(
                    child: ListTile(
                        title: Text("Home"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return Homepage(
                              email: widget.email,
                            );
                          })));
                        })),
                Card(
                    child: ListTile(
                        title: Text("Items"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return Item(email: widget.email);
                          })));
                        })),
                Card(
                    child: ListTile(
                        title: Text("Sign out"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return Login();
                          })));
                        }))
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text("Watson"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.menu),
              ),
              Tab(
                icon: Icon(Icons.comment),
              ),
              
            ]),
            backgroundColor: themeProvider.getTheme.secondaryHeaderColor,
          ),
          body: TabBarView(children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(widget.item.image),
                    Align(
                      child: Text(widget.item.productName,
                          style: TextStyle(fontSize: 20)),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                      child: Text(widget.item.price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23)),
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 13, left: 5),
                      child: Align(
                        child: Text(widget.item.description,
                            style: TextStyle(fontSize: 16)),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    TextField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          labelText: 'Add Review',
                        )),
                    ElevatedButton(
                        
                        onPressed: () => {
                              setState(() {
                                widget.item.review.add(new Review(
                                    review: commentController.text,
                                    email: widget.email));
                              })
                            },
                        child: Text("Post Review",
                         style: TextStyle(backgroundColor: themeProvider.getTheme.secondaryHeaderColor),)),
                        
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                  child: ListView.builder(
                      itemCount: widget.item.review.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(top: 15, left: 3, bottom: 15),
                          child: Card(
                            child: Column(children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.item.review[index].email,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, left: 2),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.item.review[index].review,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 17)),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }))),
            )
          ]),
        ));
  }
}
