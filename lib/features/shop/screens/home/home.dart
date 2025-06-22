import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // to curve these bottom edges
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  ///App Bar
                  ///
                  ///Search Bar
                  ///
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
