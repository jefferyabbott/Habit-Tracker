import 'package:flutter/material.dart';
import 'package:habit_tracker/components/side_drawer.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SideDrawer(),
    );
  }
}
