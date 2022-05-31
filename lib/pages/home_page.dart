import 'package:flutter/material.dart';
import 'package:movie/tempdb/tempdb.dart';

import '../custom_widgets/movie_item_2.dart';
import '../models/models.dart';
import '../styles.dart';
import 'new_movie_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            onPressed: () => Navigator.pushNamed(context, NewMoviePage.routeName),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context,index) =>
            MovieItem2(movie: movieList[index]),
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
