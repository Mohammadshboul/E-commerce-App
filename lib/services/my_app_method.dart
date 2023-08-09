import 'package:flutter/material.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class MyAppMethods {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required String Subtitle,
    required Function fct,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AssetsManager.warning,
                height: 60,
                width: 60,
              ),
              const SizedBox(
                height: 16,
              ),
              SubTitleTextWidget(
                lable: Subtitle,
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const SubTitleTextWidget(lable: "Cancel")),
                  ),
                  TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: const SubTitleTextWidget(lable: "Ok")),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> imagePickerDialog({
    required BuildContext context,
    required cameraFCT,
    required galleryFCT,
    required removeFCT,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: TitlesTextWidget(lable: "Choos option"),
          ),
          content: SingleChildScrollView(
            child: ListBody(children: [
              TextButton.icon(
                onPressed: () {
                  cameraFCT();

                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.camera),
                label: const SubTitleTextWidget(lable: "Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  galleryFCT();

                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.image),
                label: const SubTitleTextWidget(lable: "Gallery"),
              ),
              TextButton.icon(
                onPressed: () {
                  removeFCT();

                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.delete),
                label: const SubTitleTextWidget(lable: "remove"),
              ),
            ]),
          ),
        );
      },
    );
  }
}
