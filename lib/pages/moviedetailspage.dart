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
      body: Container(
        alignment: Alignment.center,
        height: 250,color: Colors.green,
        padding: EdgeInsets.only(top: 20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Movie Name: "+widget.movie.name!,style: TextStyle(color: Colors.white,fontSize: 18),),
              Text("Subtitle : "+widget.movie.subTitle!, style: TextStyle(color: Colors.white,fontSize: 15),),
              Image.asset(widget.movie.image!, width: 100,height: 100,),
              Text("Rating : "+widget.movie.rating!.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
              Text("Description : "+widget.movie.description!,style: TextStyle(color: Colors.white,fontSize: 12),)
            ],
          ),
        ),
      )
    );
  }
}
