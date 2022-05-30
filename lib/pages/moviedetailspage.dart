import 'package:flutter/material.dart';

class MoveDetailsPage extends StatefulWidget {
  const MoveDetailsPage({Key? key}) : super(key: key);

  @override
  State<MoveDetailsPage> createState() => _MoveDetailsPageState();
}

class _MoveDetailsPageState extends State<MoveDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Details'),),
    );
  }
}
