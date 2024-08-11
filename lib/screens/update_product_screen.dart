// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/constant.dart';
import 'package:store_app/helper/snack_bar_msg.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'Update Product Screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Update Product',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomTextField(
                  hintText: 'Product Name',
                  onChange: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: 'Description',
                    onChange: (data) {
                      desc = data;
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: 'Price',
                    inputType: TextInputType.number,
                    onChange: (data) {
                      price = data;
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: 'Image',
                    onChange: (data) {
                      image = data;
                    }),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await UpdateProduct().updateProduct(
                          id: productModel.id,
                          title: productName ?? productModel.title,
                          price: price ?? productModel.price,
                          desc: desc ?? productModel.description,
                          image: image ?? productModel.image,
                          category: productModel.category);
                      if (context.mounted) {
                        snackBarMsg(context, 'Success!');
                      }
                      isLoading = false;
                      setState(() {});
                    } catch (e) {
                      log(e.toString());
                      if (context.mounted) {
                        snackBarMsg(
                            context, 'Failed!  Please try again later.');
                        isLoading = false;
                        setState(() {});
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
