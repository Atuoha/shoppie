import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/models/product.dart';
import 'package:shoppie/providers/product.dart';

// ignore: use_key_in_widget_constructors
class AddAndEditProduct extends StatefulWidget {
  static const routeName = "/AddAndEditProduct";
  @override
  _AddAndEditProductState createState() => _AddAndEditProductState();
}

enum Data {
  name,
  imageUrl,
  description,
  price,
  previousPrice,
  colors,
}

class _AddAndEditProductState extends State<AddAndEditProduct> {
  final _nameNode = FocusNode();
  final _priceNode = FocusNode();
  final _previousPriceNode = FocusNode();
  final _colorsNode = FocusNode();
  final _imageUrlNode = FocusNode();
  final _descriptionNode = FocusNode();

  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  var _editProduct = Product(
    id: '',
    name: '',
    imageUrl: '',
    description: '',
    price: 0,
    previousPrice: 0,
    colors: '',
  );
  var _isInit = true;
  var _initValue = {
    'name': '',
    'imageUrl': '',
    'description': '',
    'price': '',
    'previousPrice': '',
    'colors': ''
  };

  var _loading = false;

  @override
  void initState() {
    _imageUrlNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var productId = ModalRoute.of(context)!.settings.arguments as String;
      // ignore: unnecessary_null_comparison
      if (productId != null) {
        _editProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValue = {
          'name': _editProduct.name,
          'imageUrl': '',
          'description': _editProduct.description,
          'price': _editProduct.price.toString(),
          'previousPrice': _editProduct.previousPrice.toString(),
          'colors': _editProduct.colors
        };
        _imageUrlController.text = _editProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _editProduct.dispose();
    _imageUrlNode.removeListener(_updateImageUrl);
    _nameNode.dispose();
    _priceNode.dispose();
    _previousPriceNode.dispose();
    _colorsNode.dispose();
    _imageUrlNode.dispose();
    _descriptionNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlNode.hasFocus) {
      if (!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https') &&
          !_imageUrlController.text.startsWith('www') &&
          !_imageUrlController.text.endsWith('.png') &&
          !_imageUrlController.text.endsWith('.jpg') &&
          !_imageUrlController.text.endsWith('.jpeg')) {
        return;
      }
      setState(() {});
    }
  }

  showDialogModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('An Error Occured!'),
        content: const Text(
          'Opps! Something went wrong. Please try again later.',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Okay'),
          )
        ],
      ),
    );
  }

  Future<void> _saveData() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _loading = true;
    });
    if (_editProduct.id == '') {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editProduct);
      } catch (e) {
        await showDialogModal(context);
      }
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .updateProduct(_editProduct);
      } catch (e) {
        await showDialogModal(context);
      }
    }
    setState(() {
      _loading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Widget customTextFormField(
      IconData icon,
      String labelText,
      String hintText,
      FocusNode focusNode,
      FocusNode requestFocus,
      Data data,
      int minLines,
      int maxLines,
      TextInputType type,
      var initValue,
    ) {
      return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a value for ${data.toString().replaceAll('Data.', '')}!';
          }

          // Validating Price and Previous Price ONLY
          if (data == Data.price || data == Data.previousPrice) {
            if (double.tryParse(value) == null) {
              return 'Enter a valid price please!';
            }

            if (double.parse(value) <= 0) {
              return 'Enter a price greater than 0';
            }
          }

          // Validating Description ONLY
          if (data == Data.description) {
            if (value.length < 10) {
              return 'Should be atleast 10 characters long';
            }
          }

          return null;
          //
        },
        initialValue: initValue,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: type,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        autofocus: true,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        focusNode: focusNode,
        onFieldSubmitted: (value) =>
            FocusScope.of(context).requestFocus(requestFocus),
        onSaved: (newValue) {
          switch (data) {
            case Data.name:
              _editProduct = Product(
                id: _editProduct.id,
                isFavorite: _editProduct.isFavorite,
                name: newValue.toString(),
                imageUrl: _editProduct.imageUrl,
                description: _editProduct.description,
                price: _editProduct.price,
                previousPrice: _editProduct.previousPrice,
                colors: _editProduct.colors,
              );
              break;

            case Data.price:
              _editProduct = Product(
                id: _editProduct.id,
                isFavorite: _editProduct.isFavorite,
                name: _editProduct.name,
                imageUrl: _editProduct.imageUrl,
                description: _editProduct.description,
                price: double.parse(newValue.toString()),
                previousPrice: _editProduct.previousPrice,
                colors: _editProduct.colors,
              );
              break;

            case Data.previousPrice:
              _editProduct = Product(
                id: _editProduct.id,
                isFavorite: _editProduct.isFavorite,
                name: _editProduct.name,
                imageUrl: _editProduct.imageUrl,
                description: _editProduct.description,
                price: _editProduct.price,
                previousPrice: double.parse(newValue.toString()),
                colors: _editProduct.colors,
              );
              break;
            case Data.description:
              _editProduct = Product(
                id: _editProduct.id,
                isFavorite: _editProduct.isFavorite,
                name: _editProduct.name,
                imageUrl: _editProduct.imageUrl,
                description: newValue.toString(),
                price: _editProduct.price,
                previousPrice: _editProduct.previousPrice,
                colors: _editProduct.colors,
              );
              break;
            case Data.colors:
              _editProduct = Product(
                id: _editProduct.id,
                isFavorite: _editProduct.isFavorite,
                name: _editProduct.name,
                imageUrl: _editProduct.imageUrl,
                description: _editProduct.description,
                price: _editProduct.price,
                previousPrice: _editProduct.previousPrice,
                colors: newValue.toString(),
              );
              break;
            default:
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Edit Product',
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.deepOrange,
            size: 25,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.save,
                color: Colors.black,
              ),
              onPressed: _saveData,
            ),
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _form,
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  children: [
                    customTextFormField(
                      Icons.text_fields,
                      'Product Name',
                      'Text here',
                      _nameNode,
                      _priceNode,
                      Data.name,
                      1,
                      1,
                      TextInputType.text,
                      _initValue['name'],
                    ),
                    const SizedBox(height: 10),
                    customTextFormField(
                      Icons.attach_money,
                      'Product Price',
                      'Text here',
                      _priceNode,
                      _previousPriceNode,
                      Data.price,
                      1,
                      1,
                      TextInputType.number,
                      _initValue['price'].toString(),
                    ),
                    const SizedBox(height: 10),
                    customTextFormField(
                      Icons.attach_money,
                      'Product Previous Price',
                      'Text here',
                      _previousPriceNode,
                      _colorsNode,
                      Data.previousPrice,
                      1,
                      1,
                      TextInputType.number,
                      _initValue['previousPrice'].toString(),
                    ),
                    const SizedBox(height: 10),
                    customTextFormField(
                      Icons.color_lens,
                      'Product Colors',
                      'E.g red,orange,yellow.',
                      _colorsNode,
                      _descriptionNode,
                      Data.colors,
                      1,
                      1,
                      TextInputType.text,
                      _initValue['colors'],
                    ),
                    const SizedBox(height: 10),
                    customTextFormField(
                      Icons.text_format,
                      'Product Description',
                      'Text here',
                      _descriptionNode,
                      _imageUrlNode,
                      Data.description,
                      3,
                      3,
                      TextInputType.multiline,
                      _initValue['description'],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a value for imageUrl!';
                              }

                              if (!value.startsWith('http') &&
                                  !value.startsWith('https') &&
                                  !value.startsWith('www')) {
                                return 'Enter a valid URL for image!';
                              }

                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Enter a valid URL for image with extensions of PNG, JPG AND JPEG!';
                              }
                              return null;
                            },
                            controller: _imageUrlController,
                            textInputAction: TextInputAction.done,
                            textAlign: TextAlign.center,
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Product ImageURL',
                              icon: const Icon(Icons.photo),
                              hintText: 'Text here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.url,
                            focusNode: _imageUrlNode,
                            onFieldSubmitted: (_) {
                              _saveData();
                            },
                            onSaved: (newValue) {
                              _editProduct = Product(
                                id: _editProduct.id,
                                isFavorite: _editProduct.isFavorite,
                                name: _editProduct.name,
                                imageUrl: newValue.toString(),
                                description: _editProduct.description,
                                price: _editProduct.price,
                                previousPrice: _editProduct.previousPrice,
                                colors: _editProduct.colors,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 7),
                        if (_imageUrlController.text != '')
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  _imageUrlController.text,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
