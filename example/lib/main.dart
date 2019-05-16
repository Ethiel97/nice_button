import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text('Nice Button Demo'),
      ),
      body: Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NiceButton(
                  // width: 515,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Login",
                  background: firstColor,
                  onPressed: () {
                    print("hello");
                  },
                ),
                NiceButton(
                  mini: true,
                  icon: Icons.home,
                  background: firstColor,
                  onPressed: () {
                    print("hello");
                  },
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
