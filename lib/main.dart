import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: Navi(),
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

  FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
            ),
            TextFormField(),
            TextField(
              focusNode: myFocusNode,
            ),
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
              padding: EdgeInsets.only(top: 30),
              child: RaisedButton(
                  child: Text("Tıkla"),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(myFocusNode);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Navi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text("Tıkla")),
      ),
    );
  }
}
