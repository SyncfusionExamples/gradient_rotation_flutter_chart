import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 320,
            child: SfCartesianChart(
                backgroundColor: Colors.white,
                primaryXAxis: NumericAxis(),
                primaryYAxis: NumericAxis(minimum: 20),
                series: <ChartSeries<_SalesData, num>>[
                  SplineRangeAreaSeries<_SalesData, num>(
                      dataSource: <_SalesData>[
                        _SalesData(2010, 35, 65),
                        _SalesData(2011, 28, 58),
                        _SalesData(2012, 34, 64),
                        _SalesData(2013, 32, 62),
                        _SalesData(2014, 40, 70),
                        _SalesData(2015, 33, 63),
                        _SalesData(2016, 30, 65),
                        _SalesData(2017, 36, 65),
                      ],
                      gradient: LinearGradient(
                          colors: [
                            Colors.purpleAccent[700],
                            Colors.purpleAccent[100],
                            Colors.purple[600],
                            Colors.deepPurpleAccent[400],
                            Colors.purple[900],
                          ],
                          stops: <double>[
                            0.1,
                            0.3,
                            0.5,
                            0.7,
                            0.9
                          ],
                          // transform: GradientRotation((135 * (3.14 / 180))),
                          // tileMode: TileMode.repeated,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      highValueMapper: (_SalesData sales, _) => sales.sales1,
                      lowValueMapper: (_SalesData sales, _) => sales.sales2)
                ]),
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales1, this.sales2);

  final num year;
  final double sales1;
  final double sales2;
}
