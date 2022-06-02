import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:jiffy/jiffy.dart';

import '../constants.dart';
import '../models/exam_model.dart';
class ExamCard extends StatelessWidget {
  const ExamCard({
    Key? key, required this.exam,
  }) : super(key: key);
final ExamModel exam;
  @override
  Widget build(BuildContext context) {
    String date=Jiffy(exam.created??"").fromNow();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15,top: 10),
      height: MediaQuery.of(context).size.height * 0.1 + 10,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      child: Stack(
        children: [
           Positioned(right: 10,bottom: 10,   child: Text(date,style: const TextStyle(color: kSecondaryColor,fontSize: 12),)),
          Positioned.fill(
            child: Row(
              children: [
                Container(
                  color:exam.examStatus!.startsWith('inAc')?Colors.red: kSecondaryColor,
                  width: 5,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12, top: 5),
                      child:  Text(
                        exam.name??"",
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 5),
                          child: const Icon(
                            IconlyBold.profile,
                            color: kSecondaryColor,
                            size: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5, top: 7),
                            child:  Text(
                             exam.student??"",
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                     Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 5),
                          child: const Icon(
                            IconlyBold.ticket_star,
                            color: kSecondaryColor,
                            size: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5, top: 7),
                            child:  Text(
                             exam.mark??"",
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
