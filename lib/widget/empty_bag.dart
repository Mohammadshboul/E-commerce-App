import 'package:flutter/material.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.suptitle,
      required this.buttontext});
  final String imagePath, title, suptitle, buttontext;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: size.height * 0.35,
              width: size.width,
            ),
            const TitlesTextWidget(
              lable: "Whoops",
              fontSize: 40,
              color: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
             SubTitleTextWidget(
              lable: title,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubTitleTextWidget(
                lable:
                    suptitle,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 20,
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () {},
              child:  Text(
                buttontext,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// "Looks like you didn't add anything yet to your cart\ngo ahead and start shopping now "