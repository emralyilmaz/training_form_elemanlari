import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: Navi(),
      theme: ThemeData(primarySwatch: Colors.red),
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
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextFormField(
              // validator işlemi sadece textformfield'larda çalısır.
              validator: (value) {
                if (value.isEmpty) {
                  return "Lütfen yazı yazınız.";
                } else {
                  return null;
                }
              },
              // decoration: InputDecoration(
              //     icon: Icon(Icons.phone),
              //     labelText: "Telefon",
              //     labelStyle: TextStyle(color: Colors.green),
              //     hintText: "Lütfen telefon numaranızı giriniz.",
              //     hintStyle: TextStyle(color: Colors.blue)),
            ),
            TextFormField(
              validator: (value) {
                if (value.length > 4) {
                  return "Lütfen en az 4 karakter yazınız.";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              // obscureText: true,
              // decoration: InputDecoration(
              //   filled: true,
              //   fillColor: Colors.yellow,
              //   border: OutlineInputBorder(),
              // )
            ),
            TextField(
              textInputAction: TextInputAction.send,
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.center,
              cursorColor: Colors.green,
              cursorWidth: 16,
              cursorRadius: Radius.circular(4),
              maxLength: 5,
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
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Kısıtlamadan Geçtiniz."),
                      ));
                    }
                    // FocusScope.of(context).requestFocus(myFocusNode);
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
