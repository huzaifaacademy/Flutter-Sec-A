import 'package:ecommerce/functions/firebase.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> keywords = [];
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
    List<String> Keywords = [];
    (() async {
      Keywords = await getProductKeywords();
      setState(() {
        keywords = Keywords;
        suggestions = keywords;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (keywords.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: textFieldWidget(
              height: size.height * 0.06,
              width: size.width * 0.8,
              radius: 0,
              hintText: "Search Keyword",
              suffixIcon: searchController.text.isNotEmpty ? Icons.close : null,
              onPressedSuffixIcon: () {
                searchController.text = "";
                setState(() {
                  suggestions = keywords;
                });
              },
              controller: searchController,
              onChanged: (String value) {
                if (searchController.text.isNotEmpty) {
                  setState(() {
                    suggestions = keywords
                        .where((element) => element.contains(value))
                        .toList();
                  });
                } else {
                  setState(() {
                    suggestions = keywords;
                  });
                }
              },
              keyboardtype: TextInputType.text,
              textInputAction: TextInputAction.search),
        ),
        body: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(suggestions[index]));
          },
        ),
      );
    } else {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
