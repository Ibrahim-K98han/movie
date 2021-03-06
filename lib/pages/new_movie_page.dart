import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie/db/db_helper.dart';
import 'package:movie/models/movies.dart';
import '../tempdb/tempdb.dart';
import '../utils.dart';

class NewMoviePage extends StatefulWidget {
  static const String routeName = '/new_movie';

  @override
  State<NewMoviePage> createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ratingController = TextEditingController();
  String? _type;
  DateTime? _selectedDate;
  String? _imagePath;
  var _imageSource = ImageSource.camera;

  @override
  void dispose() {
    _nameController.dispose();
    _subTitleController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Movie'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: _saveMovie,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Movie Name',
                  filled: true,
                  fillColor: Colors.grey.shade300
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              controller: _subTitleController,
              decoration: InputDecoration(
                  labelText: 'Movie Subtitle',
                  filled: true,
                  fillColor: Colors.grey.shade300
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              maxLines: 3,
              controller: _descriptionController,
              decoration: InputDecoration(
                  labelText: 'Description',
                  filled: true,
                  fillColor: Colors.grey.shade300
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _ratingController,
              decoration: InputDecoration(
                  labelText: 'Movie Rating',
                  filled: true,
                  fillColor: Colors.grey.shade300
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 5,),
            DropdownButtonFormField<String>(
              hint: const Text('Select Movie type'),
              value: _type,
              items: typeList.map((type) => DropdownMenuItem(
                child: Text(type),
                value: type,)).toList(),
              onChanged: (value) {
                _type = value;
              },
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Please select a movie type';
                }
              },
            ),
            SizedBox(height: 5,),
            ListTile(
              tileColor: Colors.grey.shade300,
              title: TextButton(
                child: const Text('Select Date'),
                onPressed: _selectDate,
              ),
              trailing: Text(_selectedDate == null ? 'No Date Chosen' : _selectedDate!.toIso8601String()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                      child: _imagePath == null ?
                      Image.asset('images/camera.png', fit: BoxFit.cover,) :
                      Image.file(File(_imagePath!), fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.camera),
                        onPressed: () {
                          _imageSource = ImageSource.camera;
                          _takeImage();
                        },
                        label: const Text('Capture'),
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.photo),
                        onPressed: () {
                          _imageSource = ImageSource.gallery;
                          _takeImage();
                        },
                        label: const Text('Gallery'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final dt = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime(DateTime.now().year + 10)
    );
    if(dt != null) {
      setState(() {
        _selectedDate = dt;
      });
    }
  }

  void _takeImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if(selectedImage != null) {
      setState(() {
        _imagePath = selectedImage.path;
      });
    }
  }

  void _saveMovie() {
    if(_selectedDate == null) {
      showMsg(context, 'Please select a date');
      return;
    }
    if(_imagePath == null) {
      showMsg(context, 'Please select an image');
      return;
    }
    if(_formKey.currentState!.validate()) {
      final movie = Movie(
          name: _nameController.text,
          subTitle: _subTitleController.text,
          description: _descriptionController.text,
          rating: double.parse(_ratingController.text),
          image: _imagePath,
          type: _type,
          releaseDate: _selectedDate!.millisecondsSinceEpoch
      );
      DbHelper.insertMovie(movie)
          .then((rowId) {
        Navigator.pop(context);
      }).catchError((error) {
        throw error;
      });
    }
  }
}

