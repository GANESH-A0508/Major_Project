import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/modle/cart_modle.dart';
import 'package:flutter_application_1/modle/categoreis_modle.dart';

class MyProvider extends ChangeNotifier{
  List<CategiresModle> burgerList=[];
  //List<CategiresModle> recipeList=[];
  late CategiresModle burgerModle;

  get doc => null;
  Future<void> getBurgerCategories() async{
    List<CategiresModle> newBurgerList=[];
  QuerySnapshot querySnapshot= await  FirebaseFirestore.instance.
  collection('categories').doc('2NqOsVCRETG6NaA0fzCK').collection('Burger').get();
  querySnapshot.docs.forEach((element) {
    burgerModle= CategiresModle(
      image: doc.get('image')?? '',
      name: doc.get('name')?? '',
      );  
      print(burgerModle.name);
      newBurgerList.add(burgerModle);
      burgerList=newBurgerList;
  });
  }
  get throwBurgerList{
    return burgerList;
  }



/////////////////// 2nd category ////////////////
  List<CategiresModle> recipeList = [];
  late CategiresModle recipeModle;
  Future<void> getRecipeCategory() async {
    List<CategiresModle> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('zQzxU5z8RStXQx96FdzI')
        .collection('Recipes')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModle = CategiresModle(
        image: doc.get('image')?? '',
        name: doc.get('name')?? '',
      );
      newRecipeList.add(recipeModle);
      recipeList = newRecipeList;
    });
    notifyListeners();
  }

  get throwRecipeList {
    return recipeList;
  }



  // add to cart page ////////////

  // List<CartModle> cartList=[];
  // List<CartModle> newCartList=[];
  // CartModle addToCart({
  //   required String image,
  //   required String name,
  //   required int price,
  //   required int quantity
  // }){
  //   CartModle =CartModle(image: image, name: name, price: price, quantity: quantity);

  //   newCartList.add(CartModle);
  //   cartList=newCartList;
    
  // }
  // get thorwCartList{
  //   return cartList;

  // }



}


