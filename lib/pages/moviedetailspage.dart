import 'package:flutter/material.dart';
import 'package:movie/tempdb/tempdb.dart';

import '../models/models.dart';

class MoveDetailsPage extends StatefulWidget {

  final Movie movie;
  MoveDetailsPage(this.movie);

  @override
  State<MoveDetailsPage> createState() => _MoveDetailsPageState();
}

class _MoveDetailsPageState extends State<MoveDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.name!),),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
