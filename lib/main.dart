import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ytr = TextEditingController();
  TextEditingController yto = TextEditingController();
  TextEditingController otr = TextEditingController();
  TextEditingController oto = TextEditingController();
  TextEditingController mtp = TextEditingController();
  TextEditingController ctr = TextEditingController();

  bool press = false;
  bool onematch = false;
  bool othermatch = false;
  var yr, yo, or, oo;
  var y1, y2, o1, o2, o;
  var yb, ob;
  var tm, cnrr;
  double ynrr, onrr, result, result2 = 0.0;

  calculatef1() {
    yr = int.parse(ytr.text.trim());
    yo = yto.text.trim().split('.');
    or = int.parse(otr.text.trim());
    oo = oto.text.trim().split('.');

    yb = (y1 = int.parse(yo[0]) * 6) + (y2 = int.parse(yo[1]));
    ob = (o1 = int.parse(oo[0]) * 6) + (o2 = int.parse(oo[1]));

    ynrr = (yr / yb) * 6;
    onrr = (or / ob) * 6;

    result = (ynrr - onrr);
  }

  calculatefa() async {
    await calculatef1();
    tm = int.parse(mtp.text.trim());
    cnrr = double.parse(ctr.text.trim());
    result2 = ((cnrr * tm) + result) / (tm + 1);
    print(result2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(child: new DrawerHeader(child: new Container())),
              new Container (
                child: new Column(
                    children: <Widget>[
                      new ListTile(leading: new Icon(Icons.info),
                          onTap:(){
                              setState((){
                              //  text = "info pressed";
                              });
                          }
                      ),
                      new ListTile(leading: new Icon(Icons.save),
                          onTap:(){
                            setState((){
                             // text = "save pressed";
                            });
                          }
                      ),
                      new ListTile(leading: new Icon(Icons.settings),
                          onTap:(){
                            setState((){
                            //  text = "settings pressed";
                            });
                          }
                      ),

                    ]
                ),
              )
            ],
          ),
       
        ),
      appBar: AppBar(
        title: Text(
          "NRR Calculator",
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
        //backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
/*               Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        // passing an additional context parameter to show dialog boxs

                        elevation: 20,
                        onPressed: () {
                          setState(() {
                            onematch = !false;
                          });
                        },
                        color: Colors.blue[400],
                        textColor: Colors.white,
                        child: Text(" ONE MATCH/\nFIRST MATCH",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RaisedButton(
                        // passing an additional context parameter to show dialog boxs
                        elevation: 20,
                        onPressed: () {
                          setState(() {
                            othermatch = !false;
                          });
                        },
                        color: Colors.blue[400],
                        textColor: Colors.white,
                        child: Text("ONGOING\n  SERIES",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                      ),
                    ),
                  ],
                ),
              ), */
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    //color: Colors.blue[100],
                    border: Border.all(
                      width: 0.3,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(0),
                    shadowColor: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      ' Total Match (For Series)',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 0.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: new TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: mtp,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Total played Matches",
                                      ),
                                      style: GoogleFonts.raleway(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .display2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      ' Curent NRR (For Series)',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 0.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: new TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: ctr,
                                      decoration: const InputDecoration(
                                        hintText: "Enter current NRR",
                                      ),
                                      style: GoogleFonts.raleway(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .display2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      ' Runs Scored',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 0.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: new TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: ytr,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Total Runs Scored",
                                      ),
                                      style: GoogleFonts.raleway(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .display2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 15.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      ' Overs Taken',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                    ),
                                    child: new TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: yto,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Overs Scored",
                                      ),
                                      style: GoogleFonts.raleway(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .display2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 15.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      ' Runs Given',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                    ),
                                    child: new TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: otr,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Total Runs Given",
                                      ),
                                      style: GoogleFonts.raleway(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .display2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 15.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      ' Overs Bowled',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 0.0, bottom: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                    ),
                                    child: new TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLines: null,
                                      controller: oto,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Total Overs Bowled",
                                      ),
                                      style: GoogleFonts.raleway(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .display2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        press == false
                            ? Container(
                                width: 100,
                                height: 30,
                                child: Text(
                                  '$result2',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                                alignment: Alignment.center,
                              )
                            : Container(
                                width: 100,
                                height: 30,
                                child: Text(
                                  '$result',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                                alignment: Alignment.center,
                              ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              // passing an additional context parameter to show dialog boxs

                              elevation: 10,
                              onPressed: () {
                                calculatef1();
                                setState(() {
                                  press = !false;
                                });
                              },
                              color: Colors.blue[400],
                              textColor: Colors.white,
                              child: Text("CALCULATE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RaisedButton(
                              // passing an additional context parameter to show dialog boxs
                              elevation: 10,
                              onPressed: () {
                                setState(() {
                                  press = false;
                                });
                                setState(() {
                                  ytr.clear();
                                  yto.clear();
                                  otr.clear();
                                  oto.clear();
                                  mtp.clear();
                                  ctr.clear();
                                });
                              },
                              color: Colors.blue[400],
                              textColor: Colors.white,
                              child: Text("      RESET      ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  // passing an additional context parameter to show dialog boxs

                                  elevation: 20,
                                  onPressed: () {
                                    calculatefa();
                                    setState(() {
                                      press = false;
                                    });
                                  },
                                  color: Colors.blue[400],
                                  textColor: Colors.white,
                                  child: Text("CALCULATE FOR SERIES",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
