import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthandfitness/utils/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
       body:
       SingleChildScrollView(
         child: Stack(
           children: [
             Column(children: [
              Container(
                height: 500,
                width:double.infinity ,
                        decoration: BoxDecoration(
                color:Color(0xFFF1f305c),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(70, 100))
                      ),
                child:     Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       SizedBox(height: 35,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Icon(Icons.arrow_back,color: Colors.white,),
                                           Icon(Icons.arrow_forward,color: Colors.white,),

                                         ],
                                       ),
                                     SizedBox(height: 20,),
                                     Text('Welcome, Asma',style: GoogleFonts.azeretMono(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                     SizedBox(height: 7,),
                                     Text('Choose your workout',style: GoogleFonts.azeretMono(color: Colors.white60,fontSize:12,fontWeight: FontWeight.bold),),
                                       SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 40,
                                            child: MaterialButton(
                                                color: Colors.white60.withOpacity(.3),
                                                onPressed: (){},
                                                child: Text('Categories',style: GoogleFonts.azeretMono(color: Colors.white),),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30.0),

                                                )
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            child: MaterialButton(
                                                color: Color(0xFFFd8efff),
                                                onPressed: (){
                                                  Navigator.pushNamed(context, routesName.details);

                                                },
                                                child: Text('Add Details',style: GoogleFonts.azeretMono(color: Color(0xFFF1f305c)),),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30.0),

                                                )
                                            ),
                                          ),

                                        ],

                                      ),
                  ]
                              ),
                )
                      ),
               Container(height: 400,
                 color:  Color(0xFFF1f305c),
                 child: Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(topRight: Radius.elliptical(170, 200))),),),
             ],),
             Positioned(
               top: 235,
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   children: [

                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, routesName.activity);
                    },
                      child: CategoryCards('assets/images/activity.png', 'Today Activity')),
                     SizedBox(height: 30,),
                     InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, routesName.healthMetrics);
                         },
                         child: CategoryCards('assets/images/healthmetrix.png', 'Health Metrics')),
                     SizedBox(height: 30,),
                     InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, routesName.goals);
                         },
                         child: CategoryCards('assets/images/goals.png', 'Make Goals')),

                     SizedBox(height: 30,),
                     InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, routesName.progress);
                         },
                         child: CategoryCards('assets/images/health.png', 'Your Progress')),


                 ],),
               ),
             )
           ],
         ),
       ),
      //        Container(
      //         height: 600,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           color:Color(0xFFF1f305c),
      //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
      //         ),
      //          child:Padding(
      //            padding: const EdgeInsets.all(8.0),
      //            child: Stack(
      //              children: [
      //                Column(
      //                  crossAxisAlignment: CrossAxisAlignment.start,
      //                  children: [
      //                    SizedBox(height: 35,),
      //                    Row(
      //                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                      children: [
      //                        Icon(Icons.arrow_back,color: Colors.white,),
      //                        Icon(Icons.arrow_forward,color: Colors.white,),
      //
      //                      ],
      //                    ),
      //                  SizedBox(height: 20,),
      //                  Text('Welcome, Asma',style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      //                  SizedBox(height: 7,),
      //                  Text('Choose your workout',style: GoogleFonts.poppins(color: Colors.white60,fontSize:12,fontWeight: FontWeight.bold),),
      //                    SizedBox(height: 20,),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         height: 40,
      //                         child: MaterialButton(
      //                             color: Colors.white60.withOpacity(.3),
      //                             onPressed: (){},
      //                             child: Text('Categories',style: GoogleFonts.poppins(color: Colors.white),),
      //                             shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(30.0),
      //
      //                             )
      //                         ),
      //                       ),
      //                       Container(
      //                         height: 40,
      //                         child: MaterialButton(
      //                             color: Color(0xFFFd8efff),
      //                             onPressed: (){},
      //                             child: Text('Your Session',style: GoogleFonts.poppins(color: Colors.black54),),
      //                             shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(30.0),
      //
      //                             )
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //
      //                    // ActivitySummaryCard(),
      //                    // HealthMetricsCard(),
      //                    //  GoalsCard(),
      //                    //  QuickActionsRow(),
      //                    //  ProgressVisualization(),
      //                ],
      //                ),
      //              ],
      //            ),
      //          ),
      //                    ),




      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home,color:Color(0xFFF1f305c) ,), label: "Home",),
      //     BottomNavigationBarItem(icon: Icon(Icons.fitness_center,color:Color(0xFFF1f305c)), label: "Workout"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person,color:Color(0xFFF1f305c)), label: "Profile"),
      //   ],
      // ),
    );
  }
  Widget CategoryCards(String imageUrl, String label) {
    return  Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        color: Color(0xFFFd8efff),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Positioned(
        bottom: 500,
        child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl,height: 250,), 
            Text(label,style: GoogleFonts.poppins(color: Color(0xFFF1f305c),fontSize: 17,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
// child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     Text('Steps: ${healthViewModel.healthData?.steps ?? 0}'),
//     Text('Blood Glucose: ${healthViewModel.healthData?.bloodGlucose ?? 0.0}'),
//     ElevatedButton(
//       onPressed: () {
//         healthViewModel.healthFunc();
//       },
//       child: Text('Get Health Data'),
//     ),
//   ],
// ),

