import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie/db/db_helper.dart';
import '../models/movies.dart';

class MovieProvider extends ChangeNotifier{
  List<Movie> movieList = [];

  Future<int> addNewMovie(Movie movie){
    return DbHelper.insertMovie(movie);
  }
  void getAllMovies(){
    DbHelper.getAllMovies().then((list){

    });
  }
}