import 'package:flutter/material.dart';

class WeatherScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback handleRefresh;
  const WeatherScreenAppbar({super.key, required this.handleRefresh});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Weather App',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            onPressed: handleRefresh,
            icon: Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
