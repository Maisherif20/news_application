import 'package:flutter/material.dart';
import 'package:news_application/providers/settingProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LanguageSelectorBottomSheet extends StatefulWidget {
  @override
  State<LanguageSelectorBottomSheet> createState() =>
      _LanguageSelectorBottomSheetState();
}

class _LanguageSelectorBottomSheetState
    extends State<LanguageSelectorBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              settingProvider.changeLang('en');
            },
            child: settingProvider.currentLang == 'en'
                ? getSelectedItem("English")
                : getUnSelectedItem("English"),
          ),
          InkWell(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Only English Available Now ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.green,
                  fontSize: 20.0);

            },
            child: settingProvider.currentLang == 'ar'
                ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                : getUnSelectedItem(AppLocalizations.of(context)!.arabic),
          )
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(57, 165, 82, 1)),
          ),
          Spacer(),
          Icon(Icons.check_box, size: 30, color: Color.fromRGBO(57, 165, 82, 1))
        ],
      ),
    );
  }

  Widget getUnSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(57, 165, 82, 1)),
          ),
        ],
      ),
    );
  }
}
