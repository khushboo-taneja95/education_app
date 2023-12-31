import 'package:education_app/constant/colors.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String? leadingIcon;
  final String title;
  final GestureTapCallback? onTap;
  const SettingItem(
      {Key? key, required this.title, this.onTap, this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: EducationAppColors.appColor,
              borderRadius: BorderRadius.circular(50 / 2),
            ),
            child: Center(
              child: Image.asset(
                leadingIcon!,
                width: 22,
                height: 22,
                color: Colors.white,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(6),
          //   child: Image.asset(
          //     Image.asset!,
          //     color: NewsAppColors.colorBlack,
          //     width: 22,
          //     height: 22,
          //   ),
          // ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // const Icon(
          //   Icons.arrow_forward_ios,
          //   color: Colors.grey,
          //   size: 17,
          // )
        ]),
      ),
    );
  }
}
