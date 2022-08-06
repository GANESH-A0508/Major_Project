import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/detail_page.dart';
import 'package:flutter_application_1/src/screen/homee.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/my_provider.dart';

class AllCartpage extends StatefulWidget {
  const AllCartpage({Key? key}) : super(key: key);

  @override
  State<AllCartpage> createState() => _AllCartpageState();
}

class _AllCartpageState extends State<AllCartpage> {
  int quantity = 1;
  int price = 50;
  int total = 150;
  int quantity1 = 1;
  int price1 = 30;
  int total1 = 150;
  // int quantity2 = 1;
  // int price2 = 30;
  // int total2 = 150;
  @override
  Widget build(BuildContext context) {
    //MyProvider provider=Provider.of<MyProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
          color: Color(0x3ff3a3e3e),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              //"\$50",
              "\$${((price1*quantity1)+(quantity*price))}",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            GestureDetector(
              onTap: () => launch('https://p.paytm.me/xCTH/2o06pfn7'),
              child: Text(
                "Pay Now",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homee()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      // body: ListView.builder(
      //   itemBuilder: provider.thorwCartList,

      // ),
      body: Column(
    
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
        
        [
          
          Row(
            children: [
              Container(
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/meals.jpg'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meals",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Meals is delicious and up to the mark.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          //"\$50",
                          "\$${price * quantity}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              }),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                  if (quantity > 1) quantity--;
                                });
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              //"1",
                              '$quantity',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  quantity++;
                                });
                              }),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                  quantity++;
                                });
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),



                ],
              )),
            ],
          ),


//////////////////////Parola Cart Page///////////////////////////////////////////////////////////

Row(
            children: [
              
              Container(
                
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/Parota.jpg'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Parota",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Parota is delicious and up to the mark.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          //"\$50",
                          "\$${price1 * quantity1}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  if (quantity1 > 1) quantity1--;
                                });
                              }),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                  if (quantity1 > 1) quantity1--;
                                });
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              //"1",
                              '$quantity1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  quantity1++;
                                });
                              }),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                  quantity1++;
                                });
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),



                ],
              )),
            ],
          ),



          
// //////////////////////Chapathi Cart Page///////////////////////////////////////////////////////////

// Row(
//             children: [
              
//               Container(
                
//                 width: 170,
//                 height: 170,
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage('images/chapathi.jpeg'),
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                   child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   Container(
//                     height: 200,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Chapathi",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Chapthi is delicious and up to the mark.",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                         Text(
//                           //"\$50",
//                           "\$${price2 * quantity2}",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Row(
//                           children: [
//                             GestureDetector(
//                               onTap: (() {
//                                 setState(() {
//                                   if (quantity2 > 1) quantity2--;
//                                 });
//                               }),
//                               child: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                   if (quantity2 > 1) quantity2--;
//                                 });
//                                 },
//                                 icon: Icon(
//                                   Icons.remove_circle_outline,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Text(
//                               //"1",
//                               '$quantity2',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: (() {
//                                 setState(() {
//                                   quantity2++;
//                                 });
//                               }),
//                               child: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                   quantity2++;
//                                 });
//                                 },
//                                 icon: Icon(
//                                   Icons.add_circle_outline,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     ),
//                   ),



//                 ],
//               )),
//             ],
//           ),



        ],
      ),
    );
  }
}
