import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modle/categoreis_modle.dart';
import 'package:flutter_application_1/provider/my_provider.dart';
import 'package:flutter_application_1/src/screen/about_page.dart';
import 'package:flutter_application_1/src/screen/all_pagecart.dart';
import 'package:flutter_application_1/src/screen/cart_page.dart';
import 'package:flutter_application_1/src/screen/chapathi_page.dart';
import 'package:flutter_application_1/src/screen/detail_page.dart';
import 'package:flutter_application_1/src/screen/drink_page.dart';
import 'package:flutter_application_1/src/screen/home.dart';
import 'package:flutter_application_1/src/screen/login_page.dart';
import 'package:flutter_application_1/src/screen/orders_page.dart';
import 'package:flutter_application_1/src/screen/parotapage.dart';
import 'package:flutter_application_1/src/screen/profile_page.dart';
import 'package:flutter_application_1/src/screen/search.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);
  // final Authentica _auth= AuthService();


  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {



  

  int quantity = 1;
  int price = 50;
  int total = 150;

  // Future signOut() async{
  //   try{
  //     return await _auth.signOut();
  //   }
  // }
  List<CategiresModle> burgerList=[];
  List<CategiresModle> recipeList = [];


  Widget Parota({required String image, required String price, required String name}){
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
              backgroundImage: AssetImage(image),
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
                Text(name, style: TextStyle(color: Colors.white,fontSize: 40,),),
                Text("Any text......", style: TextStyle(color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      GestureDetector(
                        onTap: (() {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              }),
                        child: Container(
                          width: 40,
                          height: 40,
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                      
                          ),
                          child: Icon(Icons.remove),
                        ),
                      ),
                       SizedBox(width: 10,),
                      Text("$quantity",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),

                       GestureDetector(
                         onTap: (() {
                                setState(() {
                                  quantity++;
                                });
                              }),
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
                    Text(price, style: const TextStyle(color: Colors.white, fontSize: 30),),

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
    
                        Navigator.push(context, MaterialPageRoute(builder: (context) => parotacart(image: 'images/parota.jpg', name: 'Parota', price: '23')));

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

Widget Chapathi({required String image, required String price, required String name}){
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
              backgroundImage: AssetImage(image),
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
                Text(name, style: TextStyle(color: Colors.white,fontSize: 40,),),
                Text("Any text......", style: TextStyle(color: Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      GestureDetector(
                         onTap: (() {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              }),
                        child: Container(
                          width: 40,
                          height: 40,
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                      
                          ),
                          child: Icon(Icons.remove),
                        ),
                      ),
                       SizedBox(width: 10,),
                      Text('$quantity',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),

                       GestureDetector(
                          onTap: (() {
                                setState(() {
                                  quantity++;
                                });
                              }),
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
                    Text(price, style: const TextStyle(color: Colors.white, fontSize: 30),),

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
    
                        Navigator.push(context, MaterialPageRoute(builder: (context) => chepathicart(image: 'images/chapathi.jpeg', name: 'Chapathi', price: '23')));
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





//Chech List Widget.

Widget chepathicart({required String image, required String price, required String name}){
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
              price,
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
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
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          name,semanticsLabel: " is delicious and up to the mark.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.close, color: Colors.white,),),
                  ],

                )
                 
                ),
            ],
          )
        ],
      ),
    );

}


// drinks Detail page

Widget parotacart({required String image, required String price, required String name}){
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
              price,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            GestureDetector(
              onTap: () => //launch('https://p.paytm.me/xCTH/2o06pfn7')
              launch('https://paytm.me/z-jziu3'),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
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
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          name,semanticsLabel: " is delicious and up to the mark.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.close, color: Colors.white,),),
                  ],

                )
                 
                ),
            ],
          )
        ],
      ),
    );

}



  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }

  Widget bottonContaainer(
      {required String image, required int price, required String name}) {
    return Container(
      height: 270,
      width: 220,

      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage('images/1.png'),
        // ),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(

        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, 
              ),
            ),
            trailing: Text(
              "\$ $price",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
        
      ),
    );
  }

  Widget drawer({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget burger(){
    return Row(
      children: burgerList.map((e) => categoriesContainer(
        image: e.image, 
        name: e.name)).toList(),
    );
  }

  Widget recipe(){
    return Row(
      children: burgerList.map((e) => categoriesContainer(
        image: e.image, 
        name: e.name)).toList(),
    );
  }






  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getBurgerCategories();
    burgerList=provider.throwBurgerList;
    provider.getRecipeCategory();
    recipeList= provider.throwRecipeList;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/background.jpg"),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/logo2.jpeg'),
                  ),
                  accountName: Text("Ganesh Durgam"),
                  accountEmail: Text("Ganeshdurgam143@Gmail.com"),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: drawer(
                    icon: Icons.person,
                    name: "Profile",
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllCartpage()));
                  },
                  child: drawer(
                    icon: Icons.add_shopping_cart,
                    name: "Cart",
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage()));
                  },
                  child: drawer(
                    icon: Icons.shop,
                    name: "Orders",
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                  },

                  child: drawer(
                    icon: Icons.info,
                    name: "About",
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Text(
                    "Communicate",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                //Text("Communicate", style: TextStyle(fontSize: 20, color: Colors.white),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                  },

                  child: drawer(
                    icon: Icons.lock,
                    name: "Change",
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Text("Logout is not implemented,,, it will under implementaion");
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: drawer(
                    icon: Icons.exit_to_app,
                    name: "Log out",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        
        actions: [
          GestureDetector(
             onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
            child: CircleAvatar(
              // backgroundColor: Colors.red,
              backgroundImage: AssetImage('images/logo2.jpeg'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => showSearch(context: context, delegate: Search()),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: "Search Food",
          //       hintStyle: TextStyle(color: Colors.white),
          //       prefixIcon: Icon(
          //         Icons.search,
          //         color: Colors.white,
                  
          //       ),
          //       filled: true,
          //       fillColor: Color(0xff3a3e3e),
          //       border: OutlineInputBorder(
          //         borderSide: BorderSide.none,
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //     ),
              
          //   ),
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:  [
                // burger(),
                // recipe(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllCartpage()));
                  },
                  child: categoriesContainer(image: 'images/1.png', name: 'All')),
                GestureDetector(
                   onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                  },
                  child: categoriesContainer(image: 'images/meals.jpg', name: 'Meals')),
                GestureDetector(
                   onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Parotapage()));
                  },
                  child: categoriesContainer(image: 'images/Parota.jpg', name: 'Parota')),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChapathiPage()));
                  },
                  child: categoriesContainer(image: 'images/chapathi.jpeg', name: 'Chapathi')),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkPage()));
                  },
                  child: categoriesContainer(image: 'images/drink.jpg', name: 'Drink')),
                categoriesContainer(image: 'images/6.png', name: 'Meals'),
                categoriesContainer(image: 'images/7.png', name: 'Tiffins'),
                categoriesContainer(image: 'images/8.png', name: 'Snakes'),
                categoriesContainer(image: 'images/9.png', name: 'Tea'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 515,
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                
    //             Container(
    //   height: 270,
    //   width: 220,

    //   decoration: BoxDecoration(
    //     // image: DecorationImage(
    //     //   image: AssetImage('images/1.png'),
    //     // ),
    //     color: Colors.grey,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: Column(

        
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       RaisedButton(onPressed: (){
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));

    //       },
    //       child: Text("Details", style: TextStyle(
    //             fontSize: 20,
    //             color: Colors.black,
    //           ),),
    //       ),
    //       CircleAvatar(
    //         radius: 60,
    //         backgroundImage: AssetImage('images/meals.jpg'),
    //       ),
    //       ListTile(
    //         leading: Text(
    //           "Meals",
    //           style: TextStyle(
    //             fontSize: 20,
    //             color: Colors.white,
    //           ),
    //         ),
    //         trailing: Text(
    //           "\$50",
    //           style: TextStyle(fontSize: 20, color: Colors.white),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 12),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.star,
    //               color: Colors.white,
    //               size: 20,
    //             ),
    //             Icon(
    //               Icons.star,
    //               color: Colors.white,
    //               size: 20,
    //             ),
    //             Icon(
    //               Icons.star,
    //               color: Colors.white,
    //               size: 20,
    //             ),
    //             Icon(
    //               Icons.star,
    //               color: Colors.white,
    //               size: 20,
    //             ),
    //             Icon(
    //               Icons.star,
    //               color: Colors.white,
    //               size: 20,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
        
    //   ),
    // ),

                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                  }),
                  child: bottonContaainer(
                      image: 'images/meals.jpg', name: "Meals", price: 50),
                ),


                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Parotapage()));
                  }),
                  child: bottonContaainer(
                      image: 'images/Parota.jpg', name: "Parota", price: 23),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChapathiPage()));
                  }),
                  child: bottonContaainer(
                      image: 'images/chapathi.jpeg', name: "Chapathi", price: 23),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkPage()));
                  }),
                  child: bottonContaainer(
                      image: 'images/drink.jpg', name: "Drink", price: 30),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                  }),
                  child: bottonContaainer(
                      image: 'images/2.png', name: "Burger", price: 23),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                  }),
                  child: bottonContaainer(
                    image: 'images/1.png', name: "Burger", price: 23),
                    ),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                  }),
                  child: bottonContaainer(
                      image: 'images/2.png', name: "Burger", price: 23),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class MealsPage extends StatefulWidget {
  const MealsPage({ Key? key }) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
