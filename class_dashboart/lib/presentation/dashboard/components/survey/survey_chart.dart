import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../models/sales_data.dart';

class SurveyChart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<SalesData,String>>[
          LineSeries<SalesData,String>(
              dataSource: <SalesData>[
            SalesData(year: "2020",sales: 60),
            SalesData(year: "Jan",sales: 35),
            SalesData(year: "Feb",sales: 28),
            SalesData(year: "Mar",sales: -14),
            SalesData(year: "Apr",sales: 32),
            SalesData(year: "May",sales: -10),
            SalesData(year: "June",sales: 30),
            SalesData(year: "July",sales: 37),
          ],
              xValueMapper: (SalesData sales,_)=>sales.year,
              yValueMapper: (SalesData sales,_)=>sales.sales)
      ],
      ),
    );
  }

}