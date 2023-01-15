import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  const detailpage({Key? key}) : super(key: key) ;

  @override
  _detailpageState createState() => _detailpageState();
}
// userdetail
class _detailpageState extends State<detailpage>{
  //   with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(vsync: this);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

static const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
late String name;
  late String phone;
  late String? type = "Engineer";
  bool showSpinner = false;
  late String email ;
late String address;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: const Text(
          'Staffs Details ',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
TextField(
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your name')),
              const SizedBox(
                height: 8.0,
              ),

              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your mail ')),
              const SizedBox(
                height: 8.0,
              ),
TextField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    phone = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your phone no')),
              const SizedBox(
                height: 8.0,
              ),
              
              TextField(
                  keyboardType: TextInputType.streetAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Address')),
              const SizedBox(
                height: 8.0,
              ),

              
              RadioListTile(
                title: const Text('Engineer'),
                  value: "Engineer",
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
     });
                  }),
              RadioListTile(
                title: const Text('receptionist'),
                  value: "receptionist",
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
                    });
                  }),
              ElevatedButton(
                // colour: Colors.blueAccent,
                child: const Text('save'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    

                    final info = <String, dynamic>{
                      "name": name,
                      "phone": phone,
                      "type": type,
                      "Address":address,
                      "Email ":email
                    };
                    await FirebaseFirestore.instance
                        .collection("login")
                        .doc(type)
                        .collection(email)
                        .doc("personal")
                        .set(info);

                   
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });

                  // ignore: use_build_context_synchronously
                  await Navigator.pushReplacementNamed(context, '/dashboard');
                },
              )



                 ],
        ),
      ),
      
      ),
    );
  }
}
