import 'package:bioscan/pages/fingerprint.dart';
import 'package:flutter/material.dart';

import 'style.dart';
import 'pages/home.dart';

void main() => runApp(const App());

class App extends StatelessWidget 
{
	const App({Key? key}) : super(key: key);

	static const String title = 'Fingerprint scanner';

	@override
	Widget build(BuildContext context) 
	{
		return MaterialApp(
			title: 'Flutter App',
			home: const FingerprintPage(),
			theme: ThemeData(primarySwatch: appColor),
		);
	}
}

