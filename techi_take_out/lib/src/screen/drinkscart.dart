import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/detail_page.dart';
import 'package:flutter_application_1/src/screen/drink_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Drinkscart extends StatefulWidget {
  const Drinkscart({ Key? key }) : super(key: key);

  @override
  State<Drinkscart> createState() => _DrinkscartState();
}

class _DrinkscartState extends State<Drinkscart> {
  int quantity = 1;
  int price = 50;
  int total = 150;
  @override
  Widget build(BuildContext context) {
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
              "\$${price*quantity}",
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
                context, MaterialPageRoute(builder: (context) => DrinkPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      // body: ListView.builder(
      //   itemBuilder: provider.thorwCartList,

      // ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/drink.jpg'),
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
                          "Drinks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Drinks is delicious and up to the mark.",
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
                        )
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
          )
        ],
      ),
    );
  }
}