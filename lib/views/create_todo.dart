import 'package:flutter/material.dart';
import 'package:todo_app/utiles.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('create new Todo'),
      ),
      body: Form(
          child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                label: Text('Title'),
                hintText: 'please input your title here',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: customBlue)),
              )),
          SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 5,
            decoration: InputDecoration(
                label: Text('Description'),
                hintText: 'please enter a description',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: customBlue))),
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
                        lastDate:
                            DateTime.now().add(const Duration(days: 365)));
                  },
                  keyboardType: TextInputType.datetime,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  decoration: InputDecoration(
                      label: Text('Date'),
                      hintText: 'please select a date',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: customBlue))),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                  child: TextFormField(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                keyboardType: TextInputType.datetime,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 1,
                decoration: InputDecoration(
                    label: Text('Time'),
                    hintText: 'please select a time',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue))),
              ))
            ],
          ),const SizedBox(
            height: 35),
          TextButton(
              onPressed: () {},
              child: Text(
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
