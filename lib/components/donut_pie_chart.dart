/// Donut chart example. This is a simple pie chart with a hole in the middle.
import 'package:AI_delivery_app/plugins/base.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' show Color;

class DonutPieChart extends StatelessWidget with Base {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool? animate;
  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart<int>(
      seriesList,
      animate: animate,
      // Configure the width of the pie slices to 60px. The remaining space in
      // the chart will be left as a hole in the center.
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: dp(63).round()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 150),
      new LinearSales(2, 100),
      new LinearSales(3, 30),
      new LinearSales(4, 80),
      new LinearSales(5, 60),
      new LinearSales(6, 90),
    ];

    final List<Color> colors = [
      Color(r: 73, g: 106, b: 255),
      Color(r: 88, g: 143, b: 255),
      Color(r: 41, g: 186, b: 145),
      Color(r: 67, g: 255, b: 197),
      Color(r: 255, g: 112, b: 112),
      Color(r: 255, g: 147, b: 63),
      Color(r: 244, g: 181, b: 10),
    ];
    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        colorFn: (_, __) => colors[__ ?? 0]
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}