import 'package:AI_delivery_app/plugins/base.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' show Color;

class PositionBarChart extends StatelessWidget with Base {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool? animate;

  PositionBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory PositionBarChart.withSampleData() {
    return new PositionBarChart(
      _createSampleData(),
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    final _positionList = ['UI设计师', '职位四', '职位三', '职位二', '职位一'];

    // Y轴样式
    final axisY = new charts.OrdinalAxisSpec(
      tickProviderSpec: new charts.StaticOrdinalTickProviderSpec(
          _positionList.map((e) {
              return new charts.TickSpec(
                  e,
                  label: e,
                  style: new charts.TextStyleSpec(
                      fontSize: dp(22).round(),
                      color: new charts.Color(r: 151, g: 151, b: 151)
                  )
              );
          }).toList()
      ),
      showAxisLine: false,
    );

    // X轴样式
    final axisX = charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
            dataIsInWholeNumbers: false,
            desiredMinTickCount: 6,
            desiredMaxTickCount: 10
        ),
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
              fontSize: dp(22).round(), color: new charts.Color(r: 151, g: 151, b: 151)), //chnage white color as per your requirement.
        )
    );

    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      // X轴样式
      primaryMeasureAxis: axisX,
      // Y轴样式
      domainAxis: axisY,
      defaultRenderer: new charts.BarRendererConfig(
        // 柱状图宽度
        maxBarWidthPx: dp(20).round(),
        // 柱状图样式
        groupingType: charts.BarGroupingType.stacked,
        // 柱状距离
        stackedBarPaddingPx: 0,
        // 圆角
        cornerStrategy: const charts.ConstCornerStrategy(20),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('UI设计师', 5),
      new OrdinalSales('职位四', 25),
      new OrdinalSales('职位三', 100),
      new OrdinalSales('职位二', 75),
      new OrdinalSales('职位一', 35),
    ];

    final List<Color> colors = [
      Color(r: 79, g: 137, b: 255),
      Color(r: 233, g: 81, b: 61),
      Color(r: 244, g: 181, b: 10),
      Color(r: 41, g: 186, b: 145),
      Color(r: 79, g: 137, b: 255),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        colorFn: (_, __) => colors[__ ?? 0]
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}