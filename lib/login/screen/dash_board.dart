

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class dashborad extends StatefulWidget {
  const dashborad({super.key});

  @override
  State<dashborad> createState() => _dashboradState();
}

class _dashboradState extends State<dashborad> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('dashboard'),centerTitle: true,)),
    );
  }
}