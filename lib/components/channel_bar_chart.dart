import 'package:AI_delivery_app/plugins/base.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart' show Color;

class ChannelBarChart extends StatelessWidget with Base {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool? animate;

  ChannelBarChart(this.seriesList, {this.animate});

  factory ChannelBarChart.withSampleData() {
    return new ChannelBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Y轴样式
    final axisY = new charts.OrdinalAxisSpec(
      tickProviderSpec: new charts.StaticOrdinalTickProviderSpec([
        new charts.TickSpec(
            '投递数量',
            label: '投递数量',
            style: new charts.TextStyleSpec(
                fontSize: dp(22).round(),
                color: new charts.Color(r: 151, g: 151, b: 151)
            )
        ),
        new charts.TickSpec(
            '搜索数量',
            label: '搜索数量',
            style: new charts.TextStyleSpec(
              fontSize: dp(22).round(),
              color: new charts.Color(r: 151, g: 151, b: 151),
            )
        )
      ]),
      showAxisLine: false,
    );

    // X轴样式
    final axisX = charts.PercentAxisSpec(
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
      behaviors: [
        new charts.PercentInjector<String>(totalType: charts.PercentInjectorTotalType.domainBySeriesCategory)
      ],
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
        cornerStrategy: const charts.ConstCornerStrategy(0),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('投递数量', 5),
      new OrdinalSales('搜索数量', 25),
    ];

    final tableSalesData = [
      new OrdinalSales('投递数量', 15),
      new OrdinalSales('搜索数量', 50),
    ];

    final mobileSalesData = [
      new OrdinalSales('投递数量', 20),
      new OrdinalSales('搜索数量', 25),
    ];

    final List<Color> colors = [
      Color(r: 79, g: 137, b: 255),
      Color(r: 244, g: 181, b: 10),
      Color(r: 41, g: 186, b: 145),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'channel_1',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_, __) => colors[0],
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'channel_2',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => colors[1],
    ),
      new charts.Series<OrdinalSales, String>(
        id: 'channel_3',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        colorFn: (_, __) => colors[2],
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}