class ItemData {
   String? itemName;
   String? image;
   int? itemPrice;
  bool isAdded = false;
  ItemData({this.itemName, this.image,this.itemPrice});


  int _counter=1;

   int get counter => _counter;

  set sCounter(int value) {
    _counter = value;
  }


}