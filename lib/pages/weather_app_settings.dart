import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherAppSettings extends StatefulWidget {
  const WeatherAppSettings({Key? key}) : super(key: key);

  @override
  _WeatherAppSettingsState createState() => _WeatherAppSettingsState();
}

class _WeatherAppSettingsState extends State<WeatherAppSettings> {
  List<String> tempSettings = ["1", "0"];
  List<String> windSettings = ["1", "0"];
  List<String> paSettings = ["1", "0"];

  Future<void> initSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tempSettings = prefs.getStringList('tempSettings') ?? ["1", "0"];
      windSettings = prefs.getStringList('windSettings') ?? ["1", "0"];
      paSettings = prefs.getStringList('paSettings') ?? ["1", "0"];
    });
    // await prefs.setInt('counter', counter);
  }

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    initSettings();
  }

  // setting for 2 toggles only
  Widget createSetting(
      name, valuesList, proxyList, proxyName, valuesNamesList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ),
        Container(
          height: 25.0,
          decoration: BoxDecoration(
            color: Color(0xFFE2EBFF),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 9,
                offset: Offset(0, 9), // changes position of shadow
              ),
            ],
          ),
          child: ToggleButtons(
            isSelected: valuesList,
            borderRadius: BorderRadius.circular(20.0),
            borderWidth: 0.0,
            color: Colors.black,
            selectedColor: Colors.white,
            fillColor: Colors.blue[900],
            onPressed: (int newIndex) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                for (int i = 0; i < proxyList.length; i++) {
                  i == newIndex ? proxyList[i] = "1" : proxyList[i] = "0";
                }
              });
              prefs.setStringList(proxyName, proxyList);
            },
            children: <Widget>[
              SizedBox(
                width: 65.0,
                child: Center(
                  child: Text(
                    valuesNamesList[0],
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0),
                  ),
                ),
              ),
              SizedBox(
                width: 65.0,
                child: Center(
                  child: Text(
                    valuesNamesList[1],
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE2EBFF),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        title: Text(
          'Настройки',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Color(0xFFE2EBFF),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Единицы измерения',
                      style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE2EBFF),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 9,
                      offset: Offset(0, 9), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      createSetting(
                          'Температура',
                          [
                            tempSettings[0] == "1" ? true : false,
                            tempSettings[1] == "1" ? true : false
                          ],
                          tempSettings,
                          "tempSettings",
                          ['˚C', '˚F']),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: Colors.black.withOpacity(.15),
                      ),
                      createSetting(
                          'Сила ветра',
                          [
                            windSettings[0] == "1" ? true : false,
                            windSettings[1] == "1" ? true : false
                          ],
                          windSettings,
                          "windSettings",
                          ['м/с', 'км/ч']),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: Colors.black.withOpacity(.15),
                      ),
                      createSetting(
                          'Давление',
                          [
                            paSettings[0] == "1" ? true : false,
                            paSettings[1] == "1" ? true : false
                          ],
                          paSettings,
                          "paSettings",
                          ['мм.рт.ст.', 'гПа'])
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Изменения применятся после перезагрузки, или:',
                      style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/loading', (route) => false);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Color(0xFFEAF0FF);
                      }),
                  overlayColor:
                  MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.transparent;
                      }),
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;
                    if (states.contains(MaterialState.pressed)) {
                      _borderColor = Colors.white;
                    }
                    _borderColor = Colors.blue;

                    return BorderSide(color: _borderColor, width: 1);
                  }),
                  shape: MaterialStateProperty.resolveWith<
                      OutlinedBorder>((_) {
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10));
                  }),
                ),
                child: const Text("Применить сразу"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
