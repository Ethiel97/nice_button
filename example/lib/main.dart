import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Nice Button Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: firstColor,
        title: new Text('Nice Button Demo'),
      ),
      body: new Material(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NiceButton(
                  width: 255,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Login",
                  background: firstColor,
                  onPressed: () {},
                ),
                NiceButton(
                  mini: true,
                  icon: Icons.home,
                  background: firstColor,
                  onPressed: () {},
                ),
                NiceButton(
                  elevation: 5,
                  mini: true,
                  icon: Icons.label,
                  gradientColors: [secondColor, firstColor],
                  onPressed: () {},
                ),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "Register",
                  icon: Icons.account_box,
                  gradientColors: [secondColor, firstColor],
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
