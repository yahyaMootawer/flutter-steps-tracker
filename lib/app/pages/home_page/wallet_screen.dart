import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/app/pages/home_page/wallet_screen_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WalletScreenController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff103386),
                Color(0xff2a5298),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Obx(() {
                  return Text(
                    controller.totalPoints.toString(),
                    style: GoogleFonts.changa(
                      fontSize: 80,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 35,
                child: Text(
                  "Your total health points",
                  style: GoogleFonts.changa(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          // color: Colors.white,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Exchanges List",
                      style: GoogleFonts.cairo(
                        fontSize: 22,
                        color: Color(0xff103386),
                      ),
                    ),
                    Divider(
                      height: 4,
                      endIndent: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * .20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  final controller = Get.find<WalletScreenController>();
                  final comb = <ExchangeItem>[];
                  comb.addAll(
                    controller.redeems.map(
                      (element) => ExchangeItem(
                        Icons.shopify,
                        "You exchanged ${element.reward.price} for ${element.reward.name}",
                        element.time,
                      ),
                    ),
                  );
                  comb.addAll(
                    controller.points.map(
                      (element) => ExchangeItem(
                        Icons.attach_money,
                        "You got ${element.gainedPoints} cuz of ur ${element.stepsCount} steps",
                        element.date,
                      ),
                    ),
                  );
                  comb.sort((a, b) {
                    return b.dateTime.millisecond - a.dateTime.millisecond;
                  });

                  return ListView.builder(
                    primary: false,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: CircleAvatar(child: Icon(comb[index].icon)),
                          title: Text(comb[index].title),
                          subtitle: Text(
                            "On ${comb[index].dateTime.year}/${comb[index].dateTime.month}/${comb[index].dateTime.day} at ${comb[index].dateTime.hour} : ${comb[index].dateTime.minute}",
                          ),
                        ),
                      );
                    },
                    itemCount: comb.length,
                  );
                }),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ExchangeItem {
  final IconData icon;
  final String title;
  final DateTime dateTime;

  ExchangeItem(this.icon, this.title, this.dateTime);
}
