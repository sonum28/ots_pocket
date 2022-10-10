import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ots_pocket/bloc/user/get_user_details/get_user_details_bloc.dart';
import 'package:ots_pocket/bloc/user/get_user_details/get_user_details_state.dart';
import 'package:ots_pocket/bloc/user/user_event.dart';
import 'package:ots_pocket/drawer1.dart';
import 'package:ots_pocket/models/user_details_model.dart';
import 'package:ots_pocket/my_drawer.dart';
import 'package:ots_pocket/widget_util/app_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetUserDetailsUserBloc getUserDetailsUserBloc;

  int? totalUser;
  int? nonActiveUser;
  bool? isnotification = false;

  @override
  void initState() {
    BlocProvider.of<GetUserDetailsUserBloc>(context).add(GetUserDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Image.asset(
          "asset/images/clientImage.jpeg",
          height: 40,
        ),
        actions: [
          FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              isnotification == true
                  ? Fluttertoast.showToast(msg: "You have some Notifications!")
                  : Fluttertoast.showToast(msg: "There is no Notifications!");
            },
            child: Icon(
              isnotification == false
                  ? Icons.notifications_outlined
                  : Icons.notifications,
              color: isnotification == false ? Colors.grey : Colors.red,
              //shape: CircleBorder(side: BorderSide(color: Colors.transparent)
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xff487f4e),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: BlocBuilder<GetUserDetailsUserBloc, GetUserDetailsState>(
        builder: (context, state) {
          if (state is GetUserDetailsLoadingState) {
            return AppIndicator.circularProgressIndicator;
          } else if (state is GetUserDetailsLoadedState) {
            totalUser = state.userDetailsList?.length;
            List<UserDetails> getNonActiveUser = state.userDetailsList
                    ?.where((UserDetails element) => element.active ?? false)
                    .toList() ??
                [];
            nonActiveUser = getNonActiveUser.length;
            nonActiveUser == 0 ? isnotification = false : isnotification = true;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "User Management",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: getCard(
                                  cardBgColor: Color(0xFFf26a6e),
                                  title: "User",
                                  iconName: Icons.person),
                            ),
                            Expanded(
                              child: getCard(
                                  cardBgColor: Color(0xFFf58ed5),
                                  title: "Time Card",
                                  iconName: Icons.app_registration),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: getCard(
                                  cardBgColor: Color(0xFF9c8e8b),
                                  title: "Expenses",
                                  iconName: Icons.currency_exchange),
                            ),
                            Expanded(
                              child: getCard(
                                cardBgColor: Color(0xFF43c85d),
                                title: "Daily Reports",
                                iconName: Icons.pages_outlined,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.folder_copy_outlined),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Inventory Management",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.add,
                                color: Color(0xFF157B4F),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: getCard(
                                  cardBgColor: Color(0xFF8857c4),
                                  title: "Equipments",
                                  iconName: Icons.handyman),
                            ),
                            Expanded(
                              child: getCard(
                                  cardBgColor: Color(0xFF5270ca),
                                  title: "Consumables",
                                  iconName: Icons.settings),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetUserDetailsErrorState) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
      drawer: MyDrower1(),
    );
  }

  Widget getCard(
      {required Color cardBgColor,
      required String title,
      required IconData iconName}) {
    return GestureDetector(
      onTap: () {
        if (title == "User")
          Fluttertoast.showToast(msg: "Navigate to Users screen");
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        color: cardBgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Column(
            children: [
              getCardData1(title: title, iconName: iconName),
              SizedBox(
                height: 32.0,
              ),
              title == "User"
                  ? getCardData2()
                  : SizedBox(
                      height: 24,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCardData1({required String title, required IconData iconName}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Spacer(),
        Icon(
          iconName,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget getCardData2() {
    return Row(
      children: [
        Text(
          "Total User: ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
        Text(
          "${totalUser}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
