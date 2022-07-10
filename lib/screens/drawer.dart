import 'package:flutter/material.dart';

class VisibilityExample extends StatefulWidget {
  const VisibilityExample({Key? key}) : super(key: key);

  @override
  _VisibilityExampleState createState() {
    return _VisibilityExampleState();
  }
}

class _VisibilityExampleState extends State {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Drawer'),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                // RaisedButton(
                //   child: const Text('Show/Hide'),
                //   onPressed: showToast,
                // ),
                Visibility(
                  visible: _isVisible,
                  child: const Card(
                    child: ListTile(
                      title: Center(
                        child: Text('a'),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isVisible,
                  child: const Card(
                    child: ListTile(
                      title: Center(
                        child: Text('b'),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isVisible,
                  child: const Card(
                    child: ListTile(
                      title: Center(
                        child: Text('c'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: null),
    );
  }
}

void main() => runApp(const VisibilityExample());
