import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tree/cath/add.dart';
import 'package:tree/labExam1/labexam1_view.dart';
import 'package:tree/labExam1/products.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _HomeState();
}

class _HomeState extends State<ProductList> {
  late bool likeState;
@override
  void initState() {
    super.initState();
    likeState = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add(),
                ),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: StreamBuilder<List<Products>>(
        stream: readProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final product = snapshot.data!;

            return ListView(
              children: product.map(buildProduct).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  Widget buildProduct(Products product) => GestureDetector(
                onTap: () => gotoItemDetails(product),
    child: Card(
      child: SizedBox(
            width: 190,
            height: 340,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  product.image,
                  width: 190,
                  height: 190,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Text(
                        '₱${product.price}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Row(
                    children: [
                      starsyellow(product.rate),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${product.sold} sold',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_location,
                        size: 18,
                      ),
                      Expanded(
                        child: Text(
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          product.location,
                        ),
                      ),
                    ],
                  ),
                ),
                buttons(product),
              ],
            ),
          ),),
  );


  Stream<List<Products>> readProducts() =>
      FirebaseFirestore.instance.collection('Products').snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => Products.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );

  deleteUser(String id) {
    final docUser = FirebaseFirestore.instance.collection('Products').doc(id);
    docUser.delete();
    Navigator.pop(context);
  }

  void _showActionSheet(BuildContext context, String id) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Confirmation'),
        message: const Text(
            'Are you sure you want to delete this product? Doing this will not undo any changes.'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              deleteUser(id);
            },
            child: const Text('Continue'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget starsyellow(i) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int x = 0; x < i; x++)
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 20,
            ),
          for (int y = 0; y < 5 - i; y++)
            const Icon(
              Icons.star,
              color: Colors.grey,
              size: 20,
            ),
        ],
      );

  Widget buttons(Products product) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonLike(product),
          buttonAddtoCart(product),
        ],
      );

  Widget buttonLike(Products product) => TextButton.icon(
        onPressed: () {
          setState(() {
            if (!likeState) {
              likeState = true;
            } else {
              likeState = false;
            }
          });
        },
        icon: Icon(
          Icons.thumb_up_sharp,
          color: (!likeState) ? Colors.grey : Colors.blue,
        ),
        label: Text(
          'LIKE',
          style: TextStyle(
            color: (!likeState) ? Colors.grey : Colors.blue,
          ),
        ),
      );

  Widget buttonAddtoCart(Products product) => TextButton.icon(
        onPressed: () {
          gotoItemDetails(product);
        },
        icon: const Icon(
          Icons.remove_red_eye,
          color: Colors.grey,
        ),
        label: const Text(
          'VIEW',
          style: TextStyle(color: Colors.grey),
        ),
      );


  void gotoItemDetails(Products product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LabExam1_View(
          product: product,
        ),
      ),
    );
  }

}
