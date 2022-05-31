import 'package:flutter/material.dart';

import '../tempdb/tempdb.dart';

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
      ),
      body: Form(
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
              controller: _nameController,
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
            )
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
}
