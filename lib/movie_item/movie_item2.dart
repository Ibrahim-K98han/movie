import 'package:flutter/material.dart';
import 'package:movie/tempdb/tempdb.dart';

class MovieItem2 extends StatelessWidget {
  const MovieItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      ),
    );
  }
}
