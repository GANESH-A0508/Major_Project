import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/provider/my_provider.dart';
import 'package:flutter_application_1/src/screen/cart_page.dart';
import 'package:flutter_application_1/src/screen/homee.dart';
import 'package:provider/provider.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Widget Cart({required String image, required String price, required String name}){
int quantity=1;
int price=50;
int total=150;


  @override
  Widget build(BuildContext context) {
    //MyProvider provider=Provider.of<MyProvider>(context);
    return Scaffold(
       appBar: AppBar(
         elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homee()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            child: CircleAvatar(
              radius: 110,
              backgroundImage: AssetImage('images/meals.jpg'),
            ),

          ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,

            decoration:   BoxDecoration(
              color: Color(0xff3a3e3e),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Meals", style: TextStyle(color: Colors.white,fontSize: 40,),),
                Text("Any text......", style: TextStyle(color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                      
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                       SizedBox(width: 10,),
                      Text( '$quantity',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),

                       GestureDetector(
                         onTap: (){
                          setState(() {
                            quantity++;
                          });
                         },
                         child: Container(
                          width: 40,
                          height: 40,
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                       
                          ),
                          child: Icon(Icons.add),
                                             ),
                       ),

                    ],),
                    Text("\$${price * quantity}", style: TextStyle(color: Colors.white, fontSize: 30),),

                  ],
                ),
                Text("Description", style: TextStyle(color: Colors.white,fontSize: 25,),),
                Text(
                  "The customer app helps the customer to access the online food ordering platforms, search for the right restaurant or the dish they want to order, place their orders and pay easily.", 
                  style: TextStyle(color: Colors.grey,fontSize: 18),),

                  Container(
                    width: double.infinity,
                    height: 55,
                    child: RaisedButton(
                      color: Color(0xff2b2b2b),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                        //provider.addToCart(image: image, name: name, price: price, quantity: quantity);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 20),),
                        ],
                      ),
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