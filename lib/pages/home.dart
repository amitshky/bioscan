import 'package:flutter/material.dart';

import 'package:bioscan/pages/fingerprint.dart';
import 'package:bioscan/main.dart';

class HomePage extends StatelessWidget
{
	const HomePage({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
			appBar: AppBar(title: const Text(App.title), centerTitle: true),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						const Text('Home', style: TextStyle(fontSize: 40)),
						const SizedBox(height: 50),
						buildLogoutButton(context),
					],
				),
			)
		);
	}

	Widget buildLogoutButton(BuildContext context)
	{
		return ElevatedButton.icon(
			icon: const Icon(Icons.logout),
			label: const Text('Logout', style: TextStyle(fontSize: 20)),
			onPressed: ()	=> Navigator.of(context).pushReplacement(
				MaterialPageRoute(builder: (context) => const FingerprintPage())
			),
		);
	}
}