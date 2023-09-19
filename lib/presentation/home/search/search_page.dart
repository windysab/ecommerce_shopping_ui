import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search/search_bloc.dart';
import '../../detail_product/detail_product_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.search,
  }) : super(key: key);
  final String search;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    searchController.text = widget.search;
    context.read<SearchBloc>().add(
          SearchEvent.search(widget.search),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextFormField(
          controller: searchController,
          onFieldSubmitted: (_) {
            context.read<SearchBloc>().add(
                  SearchEvent.search(_),
                );
          },
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (state) => ListView.builder(
              itemCount: state.data.data!.length,
              itemBuilder: (context, index) {
                final product = state.data.data![index];
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    color: Colors.pink[200],
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailProductPAge(product: product)));
                      },
                      leading: ClipOval(
                        child: Image.network(
                          product.attributes!.image!,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title: Text(
                        product.attributes!.name!,
                        selectionColor: Colors.white,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Rp. ${product.attributes!.price!.toString()}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ));
              },
            ),
            error: (_) => const Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
