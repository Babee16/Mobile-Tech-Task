class PropertyImage {
  static String getImage(String inventoryType) {
    var assetImage = 'images/park_2.PNG';
    switch (inventoryType) {
      case 'Lawn Lot':
        assetImage = 'images/park_2.PNG';
        break;
      case 'Family Estate':
        assetImage = 'images/park_4.PNG';
        break;
      default:
    }
    return assetImage;
  }
}
