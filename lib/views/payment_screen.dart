import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/services/payment_services.dart';
import 'package:netflix/views/existing_card.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {

  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
       Get.to(const ExistingCardsPage());
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(
        message: 'Please wait...'
    );
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: '150',
        currency: 'USD'
    );
    await dialog.hide();
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Payment Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch(index) {
                case 0:
                  icon = const Icon(Icons.add_circle, color: Colors.red);
                  text = const Text('Pay via new card',style: TextStyle(color: Colors.white
                  ),);
                  break;
                case 1:
                  icon = const Icon(Icons.credit_card, color: Colors.red);
                  text = const Text('Pay via existing card',style: TextStyle(color: Colors.white
                  ));
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              color: Colors.red,
            ),
            itemCount: 2
        ),
      ),
    );
  }
}
