import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressVisualization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f305c), // Corrected Color

      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(70, 100)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Color(0xFF1f305c)), // Corrected Color
                  ),
                  SizedBox(height: 20), // Added spacing to avoid overlap
                  Container(
                    height: 300, // Added height for the chart container
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceEvenly,
                        maxY: 10,
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(toY: 5, color: Colors.orange),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(toY: 6, color: Colors.green),
                            ],
                          ),
                        ],
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const style = TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                );
                                switch (value.toInt()) {
                                  case 0:
                                    return Text('Jan', style: style);
                                  case 1:
                                    return Text('Feb', style: style);
                                  case 2:
                                    return Text('Mar', style: style);
                                  default:
                                    return Text('', style: style);
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 356.7,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1f305c),
                borderRadius: BorderRadius.only(topRight: Radius.elliptical(170, 200)),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/health.png',
                    height: 250,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Progress',
                    style: GoogleFonts.azeretMono(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
