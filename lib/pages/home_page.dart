import 'package:flutter/material.dart';
import 'package:movie/db/db_helper.dart';
import 'package:movie/tempdb/tempdb.dart';

import '../custom_widgets/movie_item_2.dart';
import '../models/movies.dart';
import '../styles.dart';
import 'new_movie_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _movieList = <Movie>[];


  @override
  void didChangeDependencies() {
    getData();
  }

  void getData() {
    DbHelper.getAllMovies().then((list) {
      setState(() {
        _movieList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Movie List'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.pushNamed(context, NewMoviePage.routeName).then((value) {
                  getData();
                }),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (context,index) =>
            MovieItem2(movie: _movieList[index]),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.name!,style: txtWhite,),
      subtitle: Text(movie.subTitle!, style: txtWhite,),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(movie.rating!.toString(), style: txtWhite,),
          Icon(Icons.star,color: Colors.amber),
        ],
      ),
      tileColor: Colors.grey,
    );
  }
}
