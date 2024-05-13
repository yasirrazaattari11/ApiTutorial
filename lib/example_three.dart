import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Models/UserModel.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userlist = [];
  Future<List<UserModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('APIs Tutorials'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUsersApi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: userlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'Id',
                                  value: snapshot.data![index].id.toString()),
                              ReusableRow(
                                  title: 'Name',
                                  value: snapshot.data![index].name.toString()),
                              ReusableRow(
                                  title: 'Email',
                                  value:
                                      snapshot.data![index].email.toString()),
                              ReusableRow(
                                  title: 'Username',
                                  value: snapshot.data![index].username
                                      .toString()),
                              ReusableRow(
                                  title: 'Address',
                                  value:
                                      snapshot.data![index].address!.city.toString()+
                              ' '+snapshot.data![index].address!.street.toString()
                              ),
                              ReusableRow(
                                  title: 'Company',
                                  value:
                                      snapshot.data![index].company!.name.toString()),
                              ReusableRow(
                                  title: 'Phone',
                                  value:
                                      snapshot.data![index].phone.toString()),
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
