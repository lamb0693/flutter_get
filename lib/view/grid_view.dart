import 'package:flutter/material.dart';

class MainGridView extends StatelessWidget {
  const MainGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.orangeAccent,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            const Text('Main Menu',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      double width = constraints.maxWidth;
                      return Container(
                        width: double.infinity,
                        color: Colors.grey,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: width/2-10,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: (){} ,
                              child: const Text("Go to page",
                                style: TextStyle(
                                  fontSize: 20.0
                                ),
                              )
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
