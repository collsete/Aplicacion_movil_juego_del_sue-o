import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool isMedicationUsed = true;
  bool isNightmareExist = true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            decoration: BoxDecoration(),
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 100, 20, 124), width: 1.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: SfCircularChart(
                              series: <CircularSeries>[
                                DoughnutSeries<SalesData, String>(
                                  dataSource: getChartData(),
                                  xValueMapper: (SalesData data, _) => data.salesPerson,
                                  yValueMapper: (SalesData data, _) => data.sales,
                                  pointColorMapper: (SalesData data, _) =>
                                      data.salesPerson == 'John' ? Colors.green : Colors.red,
                                  startAngle: 90,
                                  endAngle: 90,
                                  dataLabelSettings: DataLabelSettings(isVisible: true),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Horas dormidas hoy',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 100, 20, 124), width: 1.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 30)),
                          SizedBox(
                            height: 70,
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isMedicationUsed ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Uso de Medicación para dormir',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 100, 20, 124), width: 1.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 30)),
                          SizedBox(
                            height: 70,
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isNightmareExist ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Existencia de malos sueños',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(18),
            child: Text(
              'Horas dormidas esta semana',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.all(16),
            child: SfCartesianChart(
              primaryXAxis: NumericAxis(
                interval: 1,
                title: AxisTitle(text: 'Días de la semana'),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 10,
                title: AxisTitle(text: 'Horas dormidas'),
              ),
              series: <ChartSeries>[
                LineSeries<ChartData, int>(
                  dataSource: [
                    ChartData(1, 8),
                    ChartData(2, 8),
                    ChartData(3, 8),
                    ChartData(4, 8),
                    ChartData(5, 8),
                    ChartData(6, 8),
                    ChartData(7, 8),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: Colors.blue,
                ),
                LineSeries<ChartData, int>(
                  dataSource: [
                    ChartData(1, 6),
                    ChartData(2, 8),
                    ChartData(3, 9),
                    ChartData(4, 5),
                    ChartData(5, 7),
                    ChartData(6, 6),
                    ChartData(7, 8)
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.all(8),
            child: Text(
              'Calidad del sueño de los últimos días',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                  Icon(Icons.star, color: Colors.yellow, size: 30),
                  Icon(Icons.star, color: Colors.grey, size: 30),
                ],
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Abrir cuestionario'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SleepQuestionnairePopup(
                    isMedicationUsed: isMedicationUsed,
                    isNightmareExist: isNightmareExist,
                    onChangedMedication: (value) {
                      setState(() {
                        isMedicationUsed = value;
                        if (value) {
                          isNightmareExist = false;
                        }
                      });
                    },
                    onChangedNightmare: (value1) {
                      setState(() {
                        isNightmareExist = value1;
                        if (value1) {
                          isMedicationUsed = false;
                        }
                      });
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class SleepQuestionnairePopup extends StatefulWidget {
  final bool isMedicationUsed;
  final bool isNightmareExist;
  final Function(bool) onChangedMedication;
  final Function(bool) onChangedNightmare;

  SleepQuestionnairePopup({
    required this.isMedicationUsed,
    required this.isNightmareExist,
    required this.onChangedMedication,
    required this.onChangedNightmare,
  });

  @override
  _SleepQuestionnairePopupState createState() => _SleepQuestionnairePopupState();
}

class _SleepQuestionnairePopupState extends State<SleepQuestionnairePopup> {
  bool? _medicationUsed;
  bool? _nightmareExist;
  int? _perspective;
  @override
  void initState() {
    super.initState();
    _medicationUsed = widget.isMedicationUsed;
    _nightmareExist = widget.isNightmareExist;
    
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cuestionario de sueño'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('¿Has utilizado medicación para dormir?'),
            ListTile(
              leading: Radio(
                value: true,
                groupValue: _medicationUsed,
                onChanged: (bool? value) {
                  setState(() {
                    _medicationUsed = value;
                    if (value == true) {
                      _nightmareExist = false;
                    }
                  });
                },
              ),
              title: Text('Sí'),
            ),
            ListTile(
              leading: Radio(
                value: false,
                groupValue: _medicationUsed,
                onChanged: (bool? value) {
                  setState(() {
                    _medicationUsed = value;
                  });
                },
              ),
              title: Text('No'),
            ),
            SizedBox(height: 16),
            Text('¿Has experimentado malos sueños recientemente?'),
            ListTile(
              leading: Radio(
                value: true,
                groupValue: _nightmareExist,
                onChanged: (bool? value) {
                  setState(() {
                    _nightmareExist = value!;
                  });
                },
              ),
              title: Text('Sí'),
            ),
            ListTile(
              leading: Radio(
                value: false,
                groupValue: _nightmareExist,
                onChanged: (bool? value) {
                  setState(() {
                    _nightmareExist = value!;
                  });
                },
              ),
              title: Text('No'),
            ),
            SizedBox(height: 16),
            Text('¿A qué hora despertaste hoy?'),
            TextFormField(
              // Text field for wake-up time question
            ),
            SizedBox(height: 16),
            Text('¿Cuántas horas dormiste?'),
            TextFormField(
              // Text field for sleep duration question
            ),
            SizedBox(height: 16),
            Text('¿Cómo es su perspectiva respecto al sueño del usuario?'),
Row(
  children: [
    Column(
      children: [
        Radio(
          value: 1,
          groupValue: _perspective,
          onChanged: (int? value) {
            setState(() {
              _perspective = value!;
            });
          },
        ),
        Text('1', style: TextStyle(fontSize: 12)),
        SizedBox(height: 4),
        Radio(
          value: 2,
          groupValue: _perspective,
          onChanged: (int? value) {
            setState(() {
              _perspective = value!;
            });
          },
        ),
        Text('2', style: TextStyle(fontSize: 12)),
        Radio(
          value: 3,
          groupValue: _perspective,
          onChanged: (int? value) {
            setState(() {
              _perspective = value!;
            });
          },
        ),
        Text('3', style: TextStyle(fontSize: 12)),
      ],
    ),
    SizedBox(width: 8),
    Column(
      children: [
        Radio(
          value: 4,
          groupValue: _perspective,
          onChanged: (int? value) {
            setState(() {
              _perspective = value!;
            });
          },
        ),
        Text('4', style: TextStyle(fontSize: 12)),
        Radio(
          value: 5,
          groupValue: _perspective,
          onChanged: (int? value) {
            setState(() {
              _perspective = value!;
            });
          },
        ),
        Text('5', style: TextStyle(fontSize: 12)),
      ],
    ),

                
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }
}

class SalesData {
  final String salesPerson;
  final double sales;

  SalesData(this.salesPerson, this.sales);
}

List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData('John', 8),
    SalesData('coll',0)
  ];
  return chartData;
}

class ChartData {
  final int x;
  final int y;

  ChartData(this.x, this.y);
}
