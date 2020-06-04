import 'package:flutter/material.dart';
import 'package:flutter_internationalization/localization/app_locale_state.dart';
import 'package:flutter_internationalization/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    ChangeNotifierProvider<AppLocaleState>(
      child: MyApp(),
      create: (BuildContext context) => AppLocaleState(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  runInit() async {
    AppLocaleState appLocaleState = AppLocaleState();
    return await appLocaleState.fetchLocale();
  }

  @override
  void initState() {
    super.initState();
    runInit();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLocaleState>(
      builder: (context, model, child) {
        return MaterialApp(
          title: 'Flutter Localization Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: model.appLocale,
          supportedLocales: [
            Locale('en', 'English'),
            Locale('ms', 'Melayu'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: MyHomePage(),
        );
    });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('appbar_text')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              AppLocalizations.of(context).translate('title'),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Provider.of<AppLocaleState>(context, listen: false).changeLanguage(Locale("en"));
                },
                child: Text('English'),
              ),
              RaisedButton(
                onPressed: () {
                  Provider.of<AppLocaleState>(context, listen: false).changeLanguage(Locale("ms"));
                  setState(() {
                    
                  });
                },
                child: Text('Melayu'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
