import 'package:flutter/material.dart';
import 'package:news_application/providers/settingProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'languageSelectorBottomSheet.dart';
class SettingsTabWidget extends StatefulWidget {
  @override
  State<SettingsTabWidget> createState() => _SettingsTabWidgetState();
}

class _SettingsTabWidgetState extends State<SettingsTabWidget> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Text("Language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
          ),
          InkWell(
            onTap: () {
              showLanguageSelectorBottomsheet();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(57, 165, 82, 1), width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text(
                        settingProvider.currentLang == 'ar'?AppLocalizations.of(context)!.arabic:"English",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(57, 165, 82, 1)),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageSelectorBottomsheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageSelectorBottomSheet());
  }
}
