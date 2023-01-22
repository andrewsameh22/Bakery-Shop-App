import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ResuableWidgets/default_button.dart';

import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../models/settings_card_model.dart';
import '../screens/login/login_screen.dart';
import '../styles/colours.dart';

class NavSettings extends StatefulWidget {
  @override
  State<NavSettings> createState() => _NavSettingsState();
}

class _NavSettingsState extends State<NavSettings> {
  List<SettingsCard> settingsCards = [
    SettingsCard(
      title: 'Account Settings',
    ),
    SettingsCard(
      title: 'Logout',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    NavbarCubit cubit = NavbarCubit.get(context);
    return BlocConsumer<NavbarCubit, NavbarState>(
      listener: (context, stateNavbarCubit) {},
      builder: (context, state) {
        var cubit = NavbarCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Hello ${cubit.Name}',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: settingsCards.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(settingsCards[index].title),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      onTap: () {
                        settingsCards[index].title != 'Logout'
                            ? print('')
                            : showDialog(
                                context: context,
                                builder: (context) {
                                  var height =
                                      MediaQuery.of(context).size.height;
                                  var width = MediaQuery.of(context).size.width;
                                  return Container(
                                    // width:
                                    //     MediaQuery.of(context).size.width * 0.45,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      title: Center(
                                        child: Text(
                                            'Are You sure you want to log out?'),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            smalldefButton(
                                              context: context,
                                              color: Colors.black,
                                              text: 'Cancel',
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            smalldefButton(
                                              color: primaryColor,
                                              text: 'Logout',
                                              onTap: () async {
                                                //pref.clear
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                prefs.setString(
                                                    'ClientType', 'Guest');
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen(),
                                                    ));

                                                Fluttertoast.showToast(
                                                  msg:
                                                      "Successfully Logged Out",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: primaryColor,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                              },
                                              context: context,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
