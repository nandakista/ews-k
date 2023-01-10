import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:untitled/data/models/data.dart';
import 'package:untitled/ui/widgets/sky_box.dart';

class GraphComponentPressure extends StatelessWidget {
  final List<Data> chartData;
  final String yTitle;

  const GraphComponentPressure({
    Key? key,
    required this.chartData,
    required this.yTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkyBox(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 370,
      child: (chartData.isNotEmpty)
          ? Column(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Air Pressure",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        DateFormat('d MMM yyy, HH:mm').format(DateTime.now()),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SfCartesianChart(
                  series: <LineSeries<Data, DateTime>>[
                    LineSeries<Data, DateTime>(
                      dataSource: chartData,
                      color: const Color.fromARGB(255, 255, 0, 72),
                      xValueMapper: (Data data, _) => data.timeStamp!,
                      yValueMapper: (Data data, _) => double.parse(data.value),
                    )
                  ],
                  primaryXAxis: DateTimeAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      title: AxisTitle(text: 'Waktu ')),
                  primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: yTitle),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
