// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({
    Key? key,
  }) : super(key: key);

launchWhatsAppUri() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+91-9994745592',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  // Convert the WhatsAppUnilink instance to a Uri.
  // The "launch" method is part of "url_launcher".
  await launch(link.asUri());
}
var cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          // SvgPicture.asset(
          //   "assets/icons/chat.svg",
          //   height: 18,
          // ),
          SizedBox(width: kDefaultPadding / 2),
          TextButton.icon(
            onPressed: () {
 
launchWhatsAppUri


            },
            icon: Icon(Icons.chat),
            label: Text(
              "chat",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // it will cover all available spaces
          Spacer(),
          TextButton.icon(
            onPressed: () {

cart.addToCart(
            {@required dynamic productId,
             @required dynamic unitPrice,
             @required int 1,
           });



            },
            icon: Icon(Icons.shopping_bag_outlined),
            label: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
