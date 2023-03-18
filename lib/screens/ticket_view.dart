import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../utils/app_styles.dart';
// import '../widgets/layout_builder_widget.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Applayout.getSize(context);
    return SizedBox(
      width: size.width*0.86,
      height: Applayout.getHeight(GetPlatform.isAndroid==true?166:169),
      child: Container(
        margin: EdgeInsets.only(right: Applayout.getHeight(16)),
        child: Column(
            children: [
              // SHOWING BLUE PART OF THE TICKET
              Container(
                decoration: BoxDecoration(
                    color: isColor==null? const Color(0xFF526799):Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Applayout.getHeight(21)),
                      topRight: Radius.circular(Applayout.getHeight(21)),
                    )),
                padding: EdgeInsets.all(Applayout.getHeight(16)),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(ticket['from']['code'],
                          style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3, // use copywith instead foreground operation
                        ),
                        Expanded(child: Container()),
                        const ThickContainer(isColor: true,),
                        Expanded(child: Stack(
                            children: [
                              SizedBox(
                                  height: Applayout.getHeight(24),
                                child: const AppLayoutBuilderWidget(sections: 6,),
                              ),
                              Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color: isColor==null? Colors.white: const Color(0xFF8ACCF7),),)),

                              //     child: LayoutBuilder(
                              //       builder: (BuildContext context, BoxConstraints constraints) {
                              //         // print("The width is ${constraints.constrainWidth()}");
                              //         return Flex(
                              //           direction: Axis.horizontal,
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           mainAxisSize: MainAxisSize.max, // we maximize the space
                              //           //for larger screen we have more "-" and opposite for smaller screen by using LayoutBuilder, constraintWidth()
                              //           children: List.generate((constraints.constrainWidth() / 6).floor(), (index) =>
                              //               SizedBox(width: 3, height: 1,
                              //                 child: DecoratedBox(
                              //                   decoration: BoxDecoration(
                              //                       color: isColor==null? Colors.white:Colors.grey.shade300),
                              //                 ),
                              //               )),
                              //         );
                              //       },
                              //     )),
                              // Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color: isColor==null? Colors.white: const Color(0xFF8ACCF7),),)),
                            ],
                          ),
                        ),
                        const ThickContainer(isColor: true,),
                        Expanded(child: Container()),
                        Text(ticket['to']['code'], style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white): Styles.headLineStyle3,)
                      ],
                    ),
                    const Gap(3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: Applayout.getWidth(100),child: Text(ticket['from']['name'], style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle3,),
                        ),
                        Text(ticket['flying_time'], style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white): Styles.headLineStyle4,),
                        SizedBox(
                          width: Applayout.getWidth(100),child: Text(ticket['to']['name'], textAlign:TextAlign.end, style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle4,),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // SHOWING ORANGE PART OF THE TICKET
              // dotted lines
              Container(
                color: isColor==null?Styles.orangeColor:Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      height: Applayout.getHeight(20),
                      width: Applayout.getWidth(10),
                      child: DecoratedBox(decoration: BoxDecoration(
                        color: isColor==null? Colors.grey.shade200: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Applayout.getHeight(10)),
                          bottomRight: Radius.circular(Applayout.getHeight(10)),
                        )
                      )),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                              width: Applayout.getWidth(5),height: Applayout.getHeight(1),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: isColor==null? Colors.grey.shade300 :Colors.white,
                                ),
                              ),
                            )),
                          );
                        },
                      ),
                    )),
                    SizedBox(
                      height: Applayout.getHeight(20),
                      width: Applayout.getWidth(10),
                      child: DecoratedBox(decoration: BoxDecoration(
                          color: isColor==null? Colors.grey.shade200: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Applayout.getHeight(10)),
                            bottomLeft: Radius.circular(Applayout.getHeight(10)),
                          )
                      )),
                    ),
                  ],
                ),
              ),
              //details of orange part
              Container(
                decoration: BoxDecoration(
                    color: isColor==null? Styles.orangeColor: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor==null?21:0),
                      bottomRight: Radius.circular(isColor==null?21:0),
                    )),
                padding: const EdgeInsets.only(left: 16,top: 10,bottom: 16,right: 16,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(firstText: ticket['date'],
                      secondText: "Date", alignment:
                        CrossAxisAlignment.start, isColor: isColor),
                    AppColumnLayout(firstText: ticket['departure_time'],
                        secondText: "Departure time", alignment:
                        CrossAxisAlignment.center,isColor: isColor),
                    AppColumnLayout(firstText: ticket['number'].toString(),
                        secondText: "Number", alignment:
                        CrossAxisAlignment.end,isColor: isColor),
                    //     CrossAxisAlignment.start, isColor:false),
                    // AppColumnLayout(firstText: ticket['departure_time'],
                    //     secondText: "Departure time", alignment:
                    //     CrossAxisAlignment.center, isColor:true),
                    //
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     Text('23',
                    //       style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle3, // use copywith instead foreground operation
                    //     ),
                    //     const Gap(5),
                    //     Text("Number",
                    //       style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle4, // use copywith instead foreground operation
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}

//to merge aeroplane widget and dots we use STACK WIDGET