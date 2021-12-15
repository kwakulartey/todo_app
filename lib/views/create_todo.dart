import 'package:flutter/material.dart';
import 'package:todo_app/utiles.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TodoController _todoCOntroller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('create new Todo'),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  label: const Text('Title'),
                  hintText: 'please input your title here',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: customBlue)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please Enter a Title!';
                  }
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                decoration: InputDecoration(
                    label: const Text('Description'),
                    hintText: 'please enter a description',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please Enter a description';
                  }
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)))
                              .then((value) {
                            setState(() {
                              _dateController.text =
                                  DateFormat.yMMMMd().format(value!);
                            });
                          });
                        },
                        controller: _dateController,
                        keyboardType: TextInputType.datetime,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 1,
                        decoration: InputDecoration(
                            label: Text('Date'),
                            hintText: 'please select a date',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: customBlue))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select a Date';
                          }
                          if (value ==
                              DateFormat.yMMMMd().format(DateTime.now())) {
                            return 'You selected today\'s date';
                          }
                        }),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: TextFormField(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        setState(() {
                          _timeController.text = value!.format(context);
                        });
                      });
                    },
                    controller: _timeController,
                    keyboardType: TextInputType.datetime,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1,
                    decoration: InputDecoration(
                        label: Text('Time'),
                        hintText: 'please select a time',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: customBlue))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select time';
                      }
                    },
                  ))
                ],
              ),
              const SizedBox(height: 35),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String dateTime =
                          _dateController.text + " " + _timeController.text;
                      // Todo isloading
                      setState(() {});

                      bool isSuccessful = await _todoCOntroller.createTodo(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          dateTime: dateTime);
                    }
                  },
                  child: const Text(
                    'Create Todo',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: customBlue))
            ],
          )),
    );
  }
}
