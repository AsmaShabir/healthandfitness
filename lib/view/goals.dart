import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1f305c),

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
                            Text("Calories Goal:",style: GoogleFonts.poppins(color: Color(0xFFF1f305c),fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(child: _buildGoalItem("Calories Goal", "500 kcal", "60%")),
                                // _buildActivityItem("Calories Burn", healthModel.healthData?. ?? 0),
                                // _buildActivityItem("Distance", ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Steps Goal:",style: GoogleFonts.poppins(color: Color(0xFFF1f305c),fontSize: 13,fontWeight: FontWeight.w500),),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                          Flexible(child: _buildGoalItem("Steps Goal", "10,000", "45%")),

                                // _buildActivityItem("Calories Burn", healthModel.healthData?. ?? 0),
                                // _buildActivityItem("Distance", ),
                              ],
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
                  Image.asset('assets/images/goals.png',height: 250,),
                  SizedBox(width: 7,),
                  Text('Goals',style: GoogleFonts.azeretMono(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],

      ),
    );
    //   Card(
    //   child: Column(
    //     children: [
    //       Text("Goals"),
    //       SizedBox(height: 8.0),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Flexible(child: _buildGoalItem("Steps Goal", "10,000", "45%")),
    //           Flexible(child: _buildGoalItem("Calories Goal", "500 kcal", "60%")),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildGoalItem(String goal, String value, String progress) {
    // Remove '%' and parse the number as a double
    double progressValue = double.parse(progress.replaceAll('%', '')) / 100;

    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFFd8efff),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: Column(
          children: [
            Text(goal),
            Text(value, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            LinearProgressIndicator(value: progressValue),
            Text("$progress Complete"),
          ],
        ),
      ),
    );
  }
}
