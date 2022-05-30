import 'package:flutter/material.dart';
import 'package:movie/pages/moviedetailspage.dart';
import 'package:movie/tempdb/tempdb.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie List'),),
      body: ListView(
        children:
          movieList.map((movie) => Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MoveDetailsPage(movie)));
              },
              title: Text(movie.name!,style: TextStyle(color: Colors.white),),
              subtitle: Text(movie.subTitle!,style: TextStyle(color: Colors.white)),
              leading: Image.asset(movie.image!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(movie.rating!.toString()),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                ],
              ),
              tileColor: Colors.green,
            ),
          )).toList(),
      ),
    );
  }
}
