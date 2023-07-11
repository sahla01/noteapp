import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo0/screens/Secont_page.dart';
import 'package:demo0/screens/edit_page.dart';
import 'package:demo0/screens/noteCard.dart';
import 'package:flutter/material.dart';

import '../widgets/apptext.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Stream<QuerySnapshot> _stream =
  FirebaseFirestore.instance.collection('notesapp').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff91c78c),
        title:  AppText(text: "Notes",size: 23,fw: FontWeight.bold,color: const Color(0xff333333),),
        centerTitle: true,

      ),
      body:  SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              StreamBuilder<QuerySnapshot>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    List<Widget> userList = List<Widget>.from(
                      snapshot.data!.docs.map((DocumentSnapshot doc) {
                        String userId = doc.id;
                        String title =
                            (doc.data() as Map<String, dynamic>)['title'] as String? ??
                                '';
                        String description =
                            (doc.data() as Map<String, dynamic>)['description'] as String? ??
                                '';
                        return Card(
                          color: Colors.grey,
                          child: ListTile(
                              title: Text(title),
                              subtitle: Text(description),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {

                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {

                                    },
                                  ),
                                ],
                              )),
                        );
                      }),);

                    return Column(
                      children: userList,
                    );

                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
        },
        backgroundColor: Color(0xff296c24),
        child: Icon(Icons.add),
      ),
    );
  }
}
