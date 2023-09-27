import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/search/widgets/search_app_bar.dart';
import 'package:movemate/presentation/views/search/widgets/shipment_search_result_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final _focusNode = FocusNode();
  late final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      //wait for hero animation to complete
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          _focusNode.requestFocus();
        },
      );
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        focusNode: _focusNode,
        controller: _controller,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            ShipmentSearchResultView(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
