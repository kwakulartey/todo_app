import 'dart:html';
import 'dart:ui';

import "package:flutter/material.dart";

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/dodges.jpeg'),
          ),
        ),
        title: const Text(
          'My Task',
        ),
        elevation: 0,
        actions: const [
          Icon(Icons.sort),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.pink,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan a trip to finland',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(37, 43, 103, 1)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Bird and friends are waiting for you.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.pink,
                  ),
                  Text(
                    'Yesterday',
                    style: TextStyle(color: Colors.pink),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Material(borderRadius: (BorderRadius.circular(10)),
            color: const Color.fromRGBO(37, 43, 103, 0.4),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [Icon(Icons.check_circle_rounded)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
