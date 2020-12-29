import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
    GetMaterialApp(
        home: HomePage()
    )
);

class Controller extends GetxController{
  var count = 0.obs;
  dynamic increment() => count++;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
        appBar: AppBar(title: Text("Flutter Demo Home Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Obx(() =>
                  Text(
                    "${c.count}",
                    style: Theme.of(context).textTheme.headline4,
                  )
              ),
            ],
          ),
        ),
        floatingActionButton:
        FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: c.increment
        )
    );
  }
}
