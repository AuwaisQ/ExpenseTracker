import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trackexpense/app/modules/home/model/home_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  List<HomeModel> expenseList = <HomeModel>[
    HomeModel(
        icon: Icons.home,
        title: "Housing",
        dateTime: DateTime.now(),
        price: "1000",
        isCredited: true,
        description: 'abcd'),
    HomeModel(
        icon: Icons.wallet,
        title: "Wallet",
        dateTime: DateTime.now(),
        price: "300",
        isCredited: false,
        description: 'abcd'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.withOpacity(0.8),
          onPressed: (){},
        child: Icon(Icons.add_circle_outline,color: Colors.white,size: 30,),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi! Good Afternoon"),
                  Text("Auwais", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),

            Container(
              height: 200,width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 20,left: 30,right: 20,bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    stops: const [
                      0.1,
                      0.9
                    ],
                    colors: [
                      Color(0xff0c7f91),
                      Color(0xff0c7f91).withOpacity(0.7),
                    ]
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                        "₹1,00,300",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
                    Text(
                        "Balance",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        )),
                  ],),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text("Payments", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                    Container(
                      height: 50,width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Icon(Icons.add_card))
                  ],)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  children: [
                    const Text("Payments", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                    const Expanded(child: SizedBox()),
                    MaterialButton(
                      onPressed: (){},
                      height: double.minPositive,
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Row(
                        children: [
                          Text(DateFormat("dd-MMM").format(DateTime.now()), style: Theme.of(context).textTheme.bodySmall,),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                  ]
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Income
                Expanded(
                    child: Container(
                      height: 70,width: double.infinity,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left: 20,top: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff360101),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            "Expense",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            )),
                        Text(
                            "₹ 300",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.red,
                            )),
                      ],),
                    ),
                ),
                //Expense
                Expanded(
                  child: Container(
                    height:70,width: double.infinity,
                    padding: EdgeInsets.only(left: 20,top: 10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xff063604),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Income",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            )),
                        Text(
                            "₹ 1,000",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.green,
                            )),
                      ],),
                  ),
                ),
              ],
            ),

            ListView.separated(
              padding:  EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index){
                return ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  leading: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: expenseList[index].isCredited ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                      ),
                      child:  Icon( expenseList[index].icon, size: 22)
                  ),
                  title: Text(expenseList[index].title, style: Theme.of(context).textTheme.bodyMedium?.merge(const TextStyle(fontWeight: FontWeight.w500)),),
                  subtitle: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: (DateFormat("dd MMM yyyy, HH:mm").format(expenseList[index].dateTime))),
                        ],
                        style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.grey, overflow: TextOverflow.ellipsis)
                    ),
                  ),
                  trailing: Text(
                      expenseList[index].isCredited ? "₹${expenseList[index].price}" : "-₹${expenseList[index].price}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        color: expenseList[index].isCredited ? Colors.green : Colors.red,
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index){
                return Container(
                  width: double.infinity,
                  color: Colors.grey.withAlpha(25),
                  height: 1,
                  margin: const EdgeInsets.only(left: 75, right: 20),
                );
              },
              itemCount: expenseList.length,
            )
          ],
        ),
      )
    );
  }
}
