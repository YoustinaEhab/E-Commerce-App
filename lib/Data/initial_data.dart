import 'package:ecommerce_app/Data/item.dart';

enum InitialCategories { Electronics, Sports, Furniture, MakeUp }

abstract class InitialData {
  static final List<Item> initialItems = [
    Item(
      id: 1,
      name: 'Samsung 50 Inch 4K Crystal UHD Smart LED TV',
      image: 'assets/items/TV.png',
      price: 9715.00,
      description:
          'TV with Built-in Receiver and Remote Control, Model : UA50AU7000UXEG, Upscaling to effective 4K ensures you can watch the content you love in up to 4K resolution.',
      soldAmount: 2,
      categoryName: InitialCategories.Electronics.name,
    ),
    Item(
      id: 2,
      name: 'Apple ipad 2021',
      image: 'assets/items/Ipad.png',
      price: 11499.00,
      description:
          'Apple iPad 2021 (9th Generation) 10.2-Inch, 64GB, WiFi, Space Gray With Facetime - International Version.',
      soldAmount: 1,
      categoryName: InitialCategories.Electronics.name,
    ),
    Item(
      id: 3,
      name: 'Samsung Galaxy S22 Ultra',
      image: 'assets/items/Samsung S22.png',
      price: 32550.00,
      description:
          'Samsung Galaxy S22 Ultra Dual SIM Phantom Black 12GB RAM 256GB 5G - Middle East Version.',
      soldAmount: 1,
      categoryName: InitialCategories.Electronics.name,
    ),
    Item(
      id: 4,
      name: 'Lenovo Idea Pad 3 15ITL6 15.6 Inch',
      image: 'assets/items/Lenovo Laptop.png',
      price: 19699.00,
      description:
          'FHD Display Intel Core I7-1165G7 8GB Ram 1TB HDD 2GB Nivida Geforce MX450 Dos English/Arabic Abyss Blue.',
      soldAmount: 1,
      categoryName: InitialCategories.Electronics.name,
    ),
    Item(
      id: 5,
      name: 'Canon EOS 4000D DSLR Camera',
      image: 'assets/items/Camera.png',
      price: 7733.00,
      description:
          'Canon EOS 4000D DSLR With EF-S 18-55mm F/3.5-5.6 III Lens 18MP, Built-In Wi-Fi, Black.',
      soldAmount: 1,
      categoryName: InitialCategories.Electronics.name,
    ),
    Item(
      id: 6,
      name: 'Apple iPhone 14 128GB',
      image: 'assets/items/Iphone 14.png',
      price: 31650.00,
      description:
          'Apple iPhone 14 128GB Blue 5G With FaceTime - International Version.',
      soldAmount: 10,
      categoryName: InitialCategories.Electronics.name,
    ),
    Item(
      id: 7,
      name: 'Opti Neoprene Dumbbells 2x1kg',
      image: 'assets/items/1KG Dumbbell.png',
      price: 247.19,
      description:
          'Latex free. Bar material: rubber. Weight: Maximum weight on a single dumbbell: 1kg. Total package weight 2kg. Dimensions: Dumbell handgrip length: 8.5cm.',
      soldAmount: 1,
      categoryName: InitialCategories.Sports.name,
    ),
    Item(
      id: 8,
      name: '2KG Dumbbell',
      image: 'assets/items/2kg_Dumbbell.png',
      price: 395.00,
      description:
          "Premium solid integrally cast iron inside with soft touch neoprene coated, no smell. Easy to grip, comfortable hand-feel, don't slip out when sweaty.",
      soldAmount: 1,
      categoryName: InitialCategories.Sports.name,
    ),
    Item(
      id: 9,
      name: 'Fitbit sense advanced smart watch',
      image: 'assets/items/Fitness Watch.png',
      price: 8390.00,
      description:
          'Brand: Fitbit. Color: Carbon/Graphite. Operating System: Android.',
      soldAmount: 2,
      categoryName: InitialCategories.Sports.name,
    ),
    Item(
      id: 10,
      name: 'Adidas training cap',
      image: 'assets/items/sports_cap.png',
      price: 889.00,
      description:
          "Warm nights ice cream and baseball cap. Summer is here. Go out to the sun's rays to practice your launch with this adidas cap. Eliminates sweat so you feel cool on the field. A curved wing protects your eyes and the 3 bands show your athletic spirit. This product is made from Primegreen a series of recycled high performance materials.",
      soldAmount: 10,
      categoryName: InitialCategories.Sports.name,
    ),
    Item(
      id: 11,
      name: 'Jumping Rope',
      image: 'assets/items/jump_ropes.png',
      price: 175.00,
      description:
          'This top of the line sports product is made from high quality materials and is professionally engineered to provide peak performance It comes with a warranty, so you can rest easy knowing that the high quality material will last.',
      soldAmount: 1,
      categoryName: InitialCategories.Sports.name,
    ),
    Item(
      id: 12,
      name: 'Asian Wonder Grey Black Shoes for Men',
      image: 'assets/items/sports_running_shoes.png',
      price: 900.00,
      description:
          'A footwear which protects and offers comfort to your feet. Comfortable Mixed canvas upper material. Soft footbed ensures all-day comfort.',
      soldAmount: 1,
      categoryName: InitialCategories.Sports.name,
    ),
    Item(
      id: 13,
      name: 'Wall Mounted TV Unit',
      image: 'assets/items/Wall Mounted TV Unit.png',
      price: 999.00,
      description:
          'TV entertainment unit that will help you to keep your room stylish and organized. It adds unique aesthetics to your ambiance while offering an abundance of storage shelves. Display your Set-top box stand, TV remote, Wi-Fi router, Books, photo frames, or antique items.',
      soldAmount: 1,
      categoryName: InitialCategories.Furniture.name,
    ),
    Item(
      id: 14,
      name: 'Plastic Waiting Chair',
      image: 'assets/items/Chair.png',
      price: 3500.00,
      description:
          "Made with premium quality material ensuring it's longevity and durability. Elegantly designed to blend well with the overall home decoration. Bright and polished finish provide an attractive outlook.",
      soldAmount: 1,
      categoryName: InitialCategories.Furniture.name,
    ),
    Item(
      id: 15,
      name: 'Wardrobe Organizer',
      image: 'assets/items/Wardrobe.png',
      price: 799.00,
      description:
          'Portable Wardrobe Organizer Brown 110x175x45centimeter. Material Composition : Fabric, Canvas. ',
      soldAmount: 1,
      categoryName: InitialCategories.Furniture.name,
    ),
    Item(
      id: 16,
      name: 'Foldable Laptop Table',
      image: 'assets/items/Foldable Laptop Table.png',
      price: 19699.00,
      description:
          'Foldable Laptop Table With Cup Holder Brown 60 X 40cm. Enables you to place it on a regular table to help relieve neck and shoulder pain. The foldable laptop desk is suitable for almost all sizes of laptops, tablets and phones.',
      soldAmount: 10,
      categoryName: InitialCategories.Furniture.name,
    ),
    Item(
      id: 17,
      name: 'Sabia Plain-Regular Beanbag black',
      image: 'assets/items/Beanbag.png',
      price: 3000.00,
      description:
          'This bean bag is the perfect size for you to sit & rest on! It can fit anywhere because of its practical size. Its a great modern addition to your room.',
      soldAmount: 1,
      categoryName: InitialCategories.Furniture.name,
    ),
    Item(
      id: 18,
      name: 'Swing hanging chair',
      image: 'assets/items/Swing hanging chair.png',
      price: 2500.00,
      description:
          'Rattan Pure braided on steel chassis coated with rust proof... Do not constantly exposure to the sun to extend its life & Glass Increases Sun Temperature Absorption, Color Splatinum (Black), Fabric Type (Jaguar) Fill Material (Wool).',
      soldAmount: 1,
      categoryName: InitialCategories.Furniture.name,
    ),
    Item(
      id: 19,
      name: 'Essence Blush 40 Pink',
      image: 'assets/items/Blush.png',
      price: 219.00,
      description:
          'Super light texture powder blush. Available in various shades, all with a pearl finish. Perfect blushes to achieve a natural and fresh finish immediately. High pigmentation and easy to blend.',
      soldAmount: 1,
      categoryName: InitialCategories.MakeUp.name,
    ),
    Item(
      id: 20,
      name: 'Maybelline Lifter Lip Gloss 005 Petal',
      image: 'assets/items/Lip Gloss.png',
      price: 305.00,
      description:
          'Hydrated glossy fuller looking lips without filler. Breakthrough hyaluronic acid formula plumps to leave behind lasting hydration. Available in a full range of modern shades.',
      soldAmount: 1,
      categoryName: InitialCategories.MakeUp.name,
    ),
    Item(
      id: 21,
      name: 'Maybelline New York Fit Me Concealer Fair 15',
      image: 'assets/items/Concealer.png',
      price: 211.00,
      description:
          'flawless, natural coverage. oil-free. Dermatologist tested. Ophthalmologist tested. Fragrance-free. 7 Shades Available.',
      soldAmount: 1,
      categoryName: InitialCategories.MakeUp.name,
    ),
    Item(
      id: 22,
      name: 'LA Girl Eyeshadow Palette-9 Shades',
      image: 'assets/items/Eyeshadow.png',
      price: 349.00,
      description:
          'Soft Mattes, Smooth Shimmers & Intense Foils9 Playful ColorsEasy to Blend EyeshadowsTravel Friendly, Compact Eyeshadow PaletteColor-Coordinated Metallic PackagingMagnetic CaseTry it with our HD PRO Primer Eyeshadow Stick to extend the wear of your eyeshadows and lock your eye look in place.',
      soldAmount: 3,
      categoryName: InitialCategories.MakeUp.name,
    ),
    Item(
      id: 23,
      name: 'Maybelline Lash Sensational Sky High Mascara Black',
      image: 'assets/items/Mascara.png',
      price: 250.00,
      description:
          "Sky High lash impact from every angle! Maybelline's Lash Sensational Sky High mascara delivers full volume and limitless length.",
      soldAmount: 1,
      categoryName: InitialCategories.MakeUp.name,
    ),
    Item(
      id: 24,
      name: 'KIKO MILANO 103 Natural Rose',
      image: 'assets/items/Lip Stick.png',
      price: 450.00,
      description:
          'Long-lasting two-step liquid lipstick: an extraordinary combination of base colours and lip gloss with an intense and radiant finish. The colour is set onto the lips for a result that lasts up to 12 hours.',
      soldAmount: 10,
      categoryName: InitialCategories.MakeUp.name,
    ),
  ];
}
