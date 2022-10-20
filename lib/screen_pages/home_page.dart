// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_doctor/shared/auth/constant.dart';
import 'package:app_doctor/shared/auth/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List nameList = [
    "Doctor 01",
    "Doctor 02",
    "Doctor 03",
    "Doctor 04",
    "Doctor 05",
    "Doctor 06",
    "Doctor 07",
    "Doctor 08",
    "Doctor 09",
    "Doctor 10",
  ];
  List imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbS_EunOyPXOf828LVmG4usCZlyDfLt_BhFg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5DPS4oXb__3dznfOpWPIAsVIsweXug71CwQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp9UY96W7fhci8DSil1vkEtYGz07aUEE1Guw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKNyBnRMfR5eJ1wZ5tE6pmDGyveVYBRCSCrg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqrW3zl1XO4sF1wOzskLQAw7izHwF3qKlt6Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb-bnPA51FPC-8UpsGNTCF_q5MgTM7l3PQKQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFhdWh6sUKhOnIvFhBZK9mEVIgaEpOU1ZaDw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-0NgfZDYdj35CELdpYkn_H6lDGYpbuyV2nQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDwYJPhwfKvm-1GDfZn0PgTkt4MTC-H1UScA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9mDgdr30ACeyCSFCKS7wT90GLthdhjeMqRg&usqp=CAU",
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Carefriends",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Icon(
                Icons.add,
                size: 32,
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Available Doctors",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          imageList.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: Card(
                  child: ListView.separated(
                    itemCount: nameList.length,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return createSlidable(
                        context,
                        index,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(nameList[index]),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(imageList[index]),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.CallPage,
                                    arguments: imageList[index]);
                              },
                              child: Icon(
                                Icons.phone_outlined,
                                color: Constant.primaryColor,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                  ),
                ))
        ],
      ),
    ));
  }

  Slidable createSlidable(BuildContext context, index,
      {required Widget child}) {
    return Slidable(
        closeOnScroll: true,
        enabled: true,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx) {},
              icon: Icons.favorite_border_outlined,
              backgroundColor: Constant.primaryColor,
              foregroundColor: Colors.white,
            ),
            SlidableAction(
                onPressed: (ctx) {
                  setState(() {
                    if (imageList.length != 1) {
                      imageList.removeAt(index);
                      nameList.removeAt(index);
                      print("imageList length:${imageList.length}");
                    }
                  });
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete),
          ],
        ),
        key: UniqueKey(),
        child: child);
  }
}
