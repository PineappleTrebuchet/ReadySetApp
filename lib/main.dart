import 'package:flutter/material.dart'; //Import packages
import 'package:flutter/services.dart';

const double padding = 6.5; //Initalize controllers, variables, and fuctions
String resultLabel = '';
String result = '';
const List<String> courseTypes = <String>[
  'Regular',
  'Honors',
  'AP',
];

var gpaController = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

var dropdownValues = [
  courseTypes.first,
  courseTypes.first,
  courseTypes.first,
  courseTypes.first,
  courseTypes.first,
  courseTypes.first,
  courseTypes.first,
  courseTypes.first,
];

void calcUnwgt() {
  resultLabel = "Your unweighted GPA:";
  double numGrades = 0;
  double combinedGpa = 0;
  double avgGpa = 0;
  for (int i = 0; i <= gpaController.length - 1; i++) {
    if (gpaController[i].text != '') {
      int currentGrade = int.parse(gpaController[i].text);
      int currentGpa = 0;
      numGrades++;
      if (currentGrade >= 90) {
        currentGpa = 4;
      } else if (currentGrade >= 80) {
        currentGpa = 3;
      } else if (currentGrade >= 70) {
        currentGpa = 2;
      } else if (currentGrade >= 60) {
        currentGpa = 1;
      } else {
        currentGpa = 0;
      }
      combinedGpa += currentGpa;
    }
  }
  avgGpa = (combinedGpa / numGrades);
  if (((avgGpa >= 0) == false) && ((avgGpa <= 0) == false)) {
    avgGpa = 0.0;
  }
  result = avgGpa.toString();
}

void calcWgt() {
  resultLabel = "Your weighted GPA:";
  double numGrades = 0;
  double combinedGpa = 0;
  double avgGpa = 0;
  for (int i = 0; i <= gpaController.length - 1; i++) {
    if (gpaController[i].text != '') {
      int currentGrade = int.parse(gpaController[i].text);
      String currentCourseType = dropdownValues[i].toString();
      double currentGpa = 0;
      numGrades++;
      if (currentGrade >= 90) {
        currentGpa = 4;
      } else if (currentGrade >= 80) {
        currentGpa = 3;
      } else if (currentGrade >= 70) {
        currentGpa = 2;
      } else if (currentGrade >= 60) {
        currentGpa = 1;
      } else {
        currentGpa = 0;
      }
      if (currentCourseType == "Honors") {
        currentGpa += 0.5;
      } else if (currentCourseType == "AP") {
        currentGpa += 1;
      }
      combinedGpa += currentGpa;
    }
  }
  avgGpa = (combinedGpa / numGrades);
  if (((avgGpa >= 0) == false) && ((avgGpa <= 0) == false)) {
    avgGpa = 0.0;
  }
  result = avgGpa.toString();
}

void main() {
  //Run the app
  runApp(const MaterialApp(
      title: 'GPA Calculator App',
      debugShowCheckedModeBanner: false,
      home: GpaCalculatorApp()));
}

//Initalize the First Screen
class GpaCalculatorApp extends StatefulWidget {
  const GpaCalculatorApp({super.key});
  @override
  State<GpaCalculatorApp> createState() => _GpaCalculatorAppState();
}

class _GpaCalculatorAppState extends State<GpaCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GPA Calculator"),
        ),
        body: Form(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Enter your grades and select the course type below:",
                  style: TextStyle(fontSize: 27),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text("Course Grade", style: TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text("Course Type*", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[0],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #1 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[0],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[0] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[1],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #2 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[1],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[1] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[2],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #3 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[2],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[2] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[3],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #4 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[3],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[3] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[4],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #5 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[4],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[4] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[5],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #6 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[5],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[5] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[6],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #7 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[6],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[6] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          controller: gpaController[7],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              labelText: "Class #8 Grade",
                              border: OutlineInputBorder()),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValues[7],
                        hint: const Text("Select"),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValues[7] = value!;
                          });
                        },
                        items: courseTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: ElevatedButton(
                  onPressed: () {
                    calcUnwgt();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultScreen()));
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(125, 50)),
                  child: const Text("Calculate Unweighted",
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(padding),
                  child: ElevatedButton(
                      onPressed: () {
                        calcWgt();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResultScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(125, 50)),
                      child: const Text("Calculate Weighted",
                          style: TextStyle(fontSize: 20)))),
              const Padding(
                  padding: EdgeInsets.all(padding),
                  child: Text(
                    "*You do not need to change the course types if you are calculating your unweighted GPA.",
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//Initalize the second screen
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Result"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
            body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultLabel,
                      style: const TextStyle(fontSize: 30),
                    ),
                    SelectionArea(
                      child: Text(result, style: const TextStyle(fontSize: 25)),
                    ),
                  ],
                ))));
  }
}
