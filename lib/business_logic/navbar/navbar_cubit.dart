import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../bakery_profile.dart';
import '../../models/product_model.dart';
import '../../navbar_screens/nav_cart.dart';
import '../../navbar_screens/nav_home.dart';
import '../../navbar_screens/nav_orders.dart';
import '../../navbar_screens/nav_settings.dart';
import '../../screens/details_screen.dart';
import '../../screens/home_screen.dart';
import '../../styles/colours.dart';
import '../../styles/constants.dart';
import 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarInitial());
  static NavbarCubit get(context) => BlocProvider.of(context);
  String OrdersType = 'current';

  List<Widget> screens = [
    NavHome(),
    NavOrders(),
    NavCart(),
    NavSettings(),
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(NavbarTest());
  }

  String productCheck = 'All Bakeries';

  int numOfItems = 1;

  int totalprice = 0;
  void TotalPriceCalculator() {
    totalprice = 0;
    for (int i = 0; i < CartItems.length; i++) {
      totalprice += CartItems[i].counter * CartItems[i].product.price;
    }
    emit(NavbarTest());
  }

  void incnum() {
    numOfItems++;
    emit(NavbarTest());
  }

  void decnum() {
    while (numOfItems > 1) {
      numOfItems--;
    }
    emit(NavbarTest());
  }

  void choiceAction(String choice) {
    if (choice == PopItems.all) {
      productCheck = 'All Bakeries';
      emit(NavbarTest());
    } else if (choice == PopItems.light) {
      productCheck = 'Light Bakeries';
      emit(NavbarTest());
    } else if (choice == PopItems.sweet) {
      productCheck = 'Sweet Bakeries';
      emit(NavbarTest());
    }
  }

  String Name = 'Guest';
  void SharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    Name = prefs.getString('ClientName').toString();
    emit(NavbarTest());
  }

  Widget BuildBakeryCategory({
    required List category,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   crossAxisCount: 2,
//   crossAxisSpacing: 4.0,
//   mainAxisSpacing: 4.0,
// ),
          itemCount: category.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: category[index],
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
// decoration: BoxDecoration(
//   borderRadius: BorderRadius.all(Radius.circular(30.0)),
//   color: product.color,
// ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          category[index].image,
// width: MediaQuery.of(context).size.width * 0.6,
// height: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BakeryProfile(
                                    // bakery: widget.product.bakery,
                                    bakery: category[index].bakeryName ==
                                            'Mongini'
                                        ? Mongini
                                        : category[index].bakeryName == 'Etoile'
                                            ? Etoile
                                            : Exception,
                                  ),
                                ));
                          },
                          child: Text(
                            category[index].bakeryName,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: primaryColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Text(
                          category[index].title,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "\$${category[index].price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  double rating = 0;
  Widget buildOrderRating() => RatingBar.builder(
      initialRating: 1,
      minRating: 1,
      itemSize: 30,
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
      updateOnDrag: true,
      onRatingUpdate: (rating) {
        this.rating = rating;
        emit(NavbarTest());
      });
  Widget BuildOrderCategory({
    required List Orders,
  }) =>
      ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: Orders.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 4.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order ${index + 1}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          '${Orders[index].products[0].product.title} and other items...',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          Orders[index].products.length.toString() + ' items',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          'Total Order Price: \$' +
                              Orders[index].ordertotalprice.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          Orders[index].collected == false
                              ? 'Mark as collected'
                              : 'Marked as collected',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: Orders[index].collected == false
                              ? () {
                                  print(Orders[index].rating.toString());
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Rate Your Order Please'),
                                      content: buildOrderRating(),
                                      actions: [
                                        TextButton(
                                          child: Text(
                                            'Submit',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            Orders[index].rating = rating;
                                            print(Orders[index]
                                                .rating
                                                .toString());
                                            emit(NavbarTest());
                                            Orders[index].collected = true;

                                            PastOrders.add(Orders[index]);
                                            CurrentOrders.removeAt(index);
                                            emit(NavbarTest());

                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              : null,
                          elevation: 2.0,
                          fillColor: Orders[index].collected == false
                              ? Colors.grey
                              : Colors.green,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
