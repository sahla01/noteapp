import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key,}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController titlecontrollers=TextEditingController();
  TextEditingController descriptioncontrollers=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff91c78c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a valid username";
                      }
                      else
                        return null;
                    },

                    controller: titlecontrollers,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 23, horizontal: 13),
                      filled: true,
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      isDense: true,
                      fillColor: Color(0xffD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black,),
                    maxLines: 15,
                    controller: descriptioncontrollers,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 83, horizontal: 13),
                      filled: true,
                      hintText: 'Start typing',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      isDense: true,
                      fillColor: Color(0xffD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff296c24)),
                      onPressed: () {
                        FirebaseFirestore.instance.collection("notesapp").add({
                          'title': titlecontrollers.text,
                          'description': descriptioncontrollers.text
                        }).then((value) => print('user added succesfully')).
                        catchError((error)=>print('failed to add user :$error'));
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff296c24)),
                      onPressed: () {},
                      child: const Text('Cancel'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
