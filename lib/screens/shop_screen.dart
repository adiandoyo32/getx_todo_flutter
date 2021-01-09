import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learn_flutter/screens/product_tile.dart';
import 'package:getx_learn_flutter/controllers/ProductController.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // List<String> imageList = [
    //   'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    //   'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    //   'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    //   'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    //   'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    //   'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    //   'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    //   'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    //   'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    //   'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    // ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(icon: Icon(Icons.list), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_on), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16.0),
                    itemCount: productController.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPortrait ? 2 : 3,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: isPortrait
                          ? MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 0.8)
                          : MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 0.5),
                    ),
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
