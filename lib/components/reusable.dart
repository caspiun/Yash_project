import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String ?institutename;
  final double    ?rating;
  final int       ?distance;
  final int       ?price;
  const ReusableCard({super.key, this.institutename,this.rating,this.distance,this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        const Positioned(
          bottom: 8,
          child: Padding(
            padding: EdgeInsets.only(left: 20,bottom: 5),
            child: Text(

              '• 2 of your school students study here',
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF414141),

                  fontWeight: FontWeight.w400,
                  fontFamily: 'fonts/AvenirNextLTPro-Regular'
              ),
            ),
          ),
        ),
        Container(
          height: 175,
          width: 308,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(128, 0, 128, 0.02),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  height: 149,
                  width: 158, // Use BoxFit.cover to scale the image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ), // Adjust the width for the image size
                  child: Image.asset('images/download.jpeg',
                      fit: BoxFit
                          .cover),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 158,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(10),
                        ),
                        color: Color.fromRGBO(125, 35, 224, 0.8)),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Rajendra, New Delhi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'AvenirNextLTPro-Regular',
                          ),
                        ),
                      ],
                    )),
              ]),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$institutename',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'fonts/AvenirNextLTPro-Regular'),
                      ),
                      const Text(
                        'Centre',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'fonts/AvenirNextLTPro-Regular'),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.stars_sharp,
                        color: Colors.green[600],
                      ),
                      Text(
                        '$rating',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        ' • $distance kms away',
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        height: 19,
                        width: 55,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: const Color(0xFF7D23E0), width: 1.5),
                        ),
                        child: const Text('PHYSICS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily:
                                'fonts/AvenirNextLTPro-Regular',
                                fontSize: 10)),
                      ),
                      Container(
                        height: 19,
                        width: 55,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: const Color(0xFF7D23E0), width: 1.5),
                        ),
                        child: const Text('MATHS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily:
                                'fonts/AvenirNextLTPro-Regular',
                                fontSize: 10)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 19,
                        width: 70,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: const Color(0xFF7D23E0), width: 1.5),
                        ),
                        child: const Text('CHEMISTRY',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily:
                                'fonts/AvenirNextLTPro-Regular',
                                fontSize: 9)),
                      ),
                      Container(
                        height: 19,
                        width: 40,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: const Color(0xFF7D23E0), width: 1.5),
                        ),
                        child: const Text('JEE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF7D23E0),
                                fontFamily:
                                'fonts/AvenirNextLTPro-Regular',
                                fontSize: 10)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 19,
                    width: 57,
                    margin: const EdgeInsets.only(right: 50),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7D23E0),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: const Color(0xFF7D23E0), width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$price%OFF',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily:
                                'fonts/AvenirNextLTPro-Regular',
                                fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 205,
          width: 308,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(128, 0, 128, 0.1),
              borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }
}