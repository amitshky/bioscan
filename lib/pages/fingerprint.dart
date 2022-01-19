import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'package:bioscan/main.dart';
import 'package:bioscan/pages/home.dart';
import 'package:bioscan/api/local_auth_api.dart';


class FingerprintPage extends StatelessWidget
{
	const FingerprintPage({Key? key}) : super(key: key);

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
						buildAvailability(context),
						const SizedBox(height: 24),
						buildAuthenticate(context),
					],
				),
			)
		);
	}

	Widget buildAvailability(BuildContext context)
	{
		return buildButton(
			text: 'Check Availability',
			icon: Icons.done,
			onClicked: () async 
			{
				final isAvailable = await LocalAuthApi.hasBiometrics();
				final biometrics  = await LocalAuthApi.getBiometrics();
				final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

				showDialog(
					context: context, 
					builder: (context) => AlertDialog(
						title: const Text('Availability'),
						content: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							mainAxisSize: MainAxisSize.min,
							children: [
								buildText('Biometrics', isAvailable),
								buildText('Fingerprint', hasFingerprint),
							],
						),
					)
				);
			}
		);
	}

	Widget buildAuthenticate(BuildContext context)
	{
		return buildButton(text: 'Authenticate', icon: Icons.lock_open, onClicked: () async
		{
			final isAuthenticated = await LocalAuthApi.authenticate();

			if (isAuthenticated)
			{
				Navigator.of(context).pushReplacement(
					MaterialPageRoute(builder: (context) => const HomePage())
				);
			}
		});
	}

	Widget buildButton({required String text, required IconData icon, required VoidCallback onClicked})
	{
		return ElevatedButton.icon(
			onPressed: onClicked, 
			icon: Icon(icon, size: 26), 
			label: Text(text, style: const TextStyle(fontSize: 20))
		);
	}

	Widget buildText(String text, bool checked)
	{
		return Container(
			margin: const EdgeInsets.symmetric(vertical: 8),
			child: Row(
				children: [
					checked
							? const Icon(Icons.check, color: Colors.green, size: 24)
							: const Icon(Icons.close, color: Colors.red, size: 24),
					const SizedBox(width: 12),
					Text(text, style: const TextStyle(fontSize: 24)),
				],
			),
		);
	}
}