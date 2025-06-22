import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // to curve these bottom edges
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  const HomeAppBar(),

                  /// Search Bar

                  ///Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
