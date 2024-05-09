import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';
import '../../model/product.dart';
import '../../util/constants.dart';
import '../screen/product_detail_screen.dart';
final ProductController controller = Get.put(ProductController());
class ProductListView extends StatelessWidget {
  Widget countButton(int index,
      void Function(int index) counter,
      {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget listViewBody(Product item, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (_) {
            return ProductDetailScreen(item.name,item.image);
          },),);
        },
        child: Card(
          child: Row(
            children: [
              const SizedBox(width: 20),
              Image.asset(item.image,
                  fit: BoxFit.contain,
                  width: 60),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: kItemNameStyle),
                  Text(item.description, style: kItemColorStyle),
                  Text(item.price, style: kItemPriceStyle),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  countButton(index, controller.increase),
                  Obx(() =>
                      Text(controller.allProducts[index].count.toString())),
                  countButton(index, controller.decrease, icon: Icons.remove)
                ],
              )
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: controller.allProducts.length,
      itemBuilder: (context, index) {
        Product item = controller.allProducts[index];
        if (controller.isItemListScreen) {
          return listViewBody(item, index);
        } else if (controller.isCartScreen && item.count > 0) {
          return listViewBody(item, index);
        } else {
          return Container();
        }
      },
    );
  }
}
