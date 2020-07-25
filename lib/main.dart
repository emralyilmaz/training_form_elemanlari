import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.blue),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formlar"),
      ),
      body: FormWidget(),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  bool sval = true; // Switch value  için
  bool cval = true; // Checkbox value  için
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextFormField(),
            TextFormField(),
            TextField(),
            Row(
              children: <Widget>[
                Switch(
                    value: sval,
                    onChanged: (bool yeniVal) {
                      setState(() {
                        sval = yeniVal;
                      });
                    }),
                Checkbox(
                    value: cval,
                    onChanged: (bool yeniVal) {
                      setState(() {
                        cval = yeniVal;
                      });
                    })
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: RaisedButton(child: Text("Tıkla"), onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
