import 'dart:io';

import 'package:flutter/material.dart';
import '../models/movies.dart';
import '../pages/home_page.dart';
import '../pages/movie_dts.dart';

class MovieItem2 extends StatelessWidget {
  final Movie movie;
  const MovieItem2({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Hero(
              tag: movie.id!,
              child: Image.file(
                File(movie.image!,),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 10,
            right: 10,
            child: Container(
              //height: 100,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: MovieItem(movie: movie,),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(

              ),
              onPressed: () {
                Navigator.pushNamed(context,
                    MovieDetailsPage.routeName, arguments: movie);
              },
              child: Text('Details'),
            ),
          )
        ],
      ),
    );
  }
}
