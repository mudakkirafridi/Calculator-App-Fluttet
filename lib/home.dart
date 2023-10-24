import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home> {
  var userinput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 2, 0, 5),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 23),
                            child: Text(
                              userinput.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 35),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 23),
                          child: Text(
                            answer.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 50),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Mybutton(
                            title: "AC",
                            onpress: () {
                              userinput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "+/-",
                            onpress: () {
                              userinput += '+/-';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "%",
                            onpress: () {
                              userinput += '%';
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "/",
                            onpress: () {
                              userinput += '/';
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: "7",
                            onpress: () {
                              userinput += "7";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: '8',
                            onpress: () {
                              userinput += "8";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "0",
                            onpress: () {
                              userinput += "0";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "x",
                            onpress: () {
                              userinput += "x";
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: "4",
                            onpress: () {
                              userinput += "4";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "5",
                            onpress: () {
                              userinput += "5";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "6",
                            onpress: () {
                              userinput += "6";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "-",
                            onpress: () {
                              userinput += "-";
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: "1",
                            onpress: () {
                              userinput += "1";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "2",
                            onpress: () {
                              userinput += "2";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "3",
                            onpress: () {
                              userinput += "3";
                              setState(() {});
                            },
                          ),
                          Mybutton(
                            title: "+",
                            onpress: () {
                              userinput += "+";
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Mybutton(
                            title: "0",
                            onpress: () {
                              userinput += "0";
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                          Mybutton(
                            title: ".",
                            onpress: () {
                              userinput += ".";
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                          Mybutton(
                            title: "DEL",
                            onpress: () {
                              userinput =
                                  userinput.substring(0, userinput.length - 1);
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                          Mybutton(
                            title: "=",
                            onpress: () {
                              equalpress();
                              setState(() {});
                            },
                            color: Colors.blue,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  void equalpress() {
    String finalinput = userinput;
    finalinput = userinput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finalinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
