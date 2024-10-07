import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../view_model/health_view_model.dart';


class HealthMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   HealthViewModel healthViewModel =HealthViewModel();

    return Scaffold(
      backgroundColor:Color(0xFFF1f305c) ,
      body: Column(
        children: [
          Container(
              height: 500,
              width:double.infinity ,
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(70, 100))
              ),
              child:     Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back,color:Color(0xFFF1f305c) ,)),
                        SizedBox(height: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Heart Rate:",style: GoogleFonts.poppins(color: Color(0xFFF1f305c),fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 8.0),
                            Consumer<HealthViewModel>(
                            builder: (context, healthViewModel, child){
                             return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildHealthMetricItem("Heart Rate",healthViewModel.heartRate!.toStringAsFixed(1) )
                              ]
                              );
                            }
                            ),
                                ],
                              ),

                        SizedBox(height: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sleep:",style: GoogleFonts.poppins(color: Color(0xFFF1f305c),fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildHealthMetricItem("Sleep", "6h 45m"),

                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Weight:",style: GoogleFonts.poppins(color: Color(0xFFF1f305c),fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 8.0),
                            Consumer<HealthViewModel>(
                              builder: (context, healthViewModel, child){
                               return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildHealthMetricItem("Weight", healthViewModel.weight!.toStringAsFixed(1)),

                                  ],
                                );
                              }

                            )
                          ],
                        ),
                      ]
                  )
              )
          ),

          Container(height: 356.7,
            color: Colors.white ,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF1f305c),
                  borderRadius: BorderRadius.only(topRight: Radius.elliptical(170, 200))),
              child: Row(
                children: [
                  Image.asset('assets/images/healthmetrix.png',height: 300,),
                  SizedBox(width: 7,),
                  Text('Health ',style: GoogleFonts.azeretMono(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),

                ],
              ),
            ),
          ),
          // Card(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Column(
          //       children: [
          //         Text("Health Metrics"),
          //         SizedBox(height: 8.0),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             _buildHealthMetricItem("Heart Rate", "72 bpm"),
          //             _buildHealthMetricItem("Sleep", "6h 45m"),
          //             _buildHealthMetricItem("Weight", "70 kg"),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildHealthMetricItem(String label, String value) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFFd8efff),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Text(label),
        ],
      ),
    );
  }
}