import 'package:get/get.dart';

class HomePageState {
  var selectedCategoryIndex = 0.obs;
  var name = ''.obs;

  var demoItems = [
    [
      [
        'Chicago Burger',
        'https://th.bing.com/th/id/R.499730dad10f4420b1ea5ed25b300dd2?rik=3KHG0w%2bUYI2BFA&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f16%2fClassic-Cheese-Burger-PNG-Transparent-Image.png&ehk=CvfKhtpoVqrAzT2qJZnRFAYBhpZme%2fPyzO4ICPNJ0A0%3d&risl=&pid=ImgRaw&r=0',
        '50'
      ],
      [
        'Italizan Burger',
        'https://th.bing.com/th/id/R.499730dad10f4420b1ea5ed25b300dd2?rik=3KHG0w%2bUYI2BFA&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f16%2fClassic-Cheese-Burger-PNG-Transparent-Image.png&ehk=CvfKhtpoVqrAzT2qJZnRFAYBhpZme%2fPyzO4ICPNJ0A0%3d&risl=&pid=ImgRaw&r=0',
        '20'
      ],
      [
        'California Burger',
        'https://th.bing.com/th/id/R.499730dad10f4420b1ea5ed25b300dd2?rik=3KHG0w%2bUYI2BFA&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f16%2fClassic-Cheese-Burger-PNG-Transparent-Image.png&ehk=CvfKhtpoVqrAzT2qJZnRFAYBhpZme%2fPyzO4ICPNJ0A0%3d&risl=&pid=ImgRaw&r=0',
        '70'
      ],
      [
        'Chicago Burger',
        'https://th.bing.com/th/id/R.499730dad10f4420b1ea5ed25b300dd2?rik=3KHG0w%2bUYI2BFA&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f16%2fClassic-Cheese-Burger-PNG-Transparent-Image.png&ehk=CvfKhtpoVqrAzT2qJZnRFAYBhpZme%2fPyzO4ICPNJ0A0%3d&risl=&pid=ImgRaw&r=0',
        '100'
      ],
      [
        'Italizan Burger',
        'https://th.bing.com/th/id/R.499730dad10f4420b1ea5ed25b300dd2?rik=3KHG0w%2bUYI2BFA&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f16%2fClassic-Cheese-Burger-PNG-Transparent-Image.png&ehk=CvfKhtpoVqrAzT2qJZnRFAYBhpZme%2fPyzO4ICPNJ0A0%3d&risl=&pid=ImgRaw&r=0',
        '30'
      ],
      [
        'California Burger',
        'https://th.bing.com/th/id/R.499730dad10f4420b1ea5ed25b300dd2?rik=3KHG0w%2bUYI2BFA&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f16%2fClassic-Cheese-Burger-PNG-Transparent-Image.png&ehk=CvfKhtpoVqrAzT2qJZnRFAYBhpZme%2fPyzO4ICPNJ0A0%3d&risl=&pid=ImgRaw&r=0',
        '100'
      ],
    ],
    [
      [
        'Chicago Drink',
        'https://pngimg.com/uploads/cocktail/cocktail_PNG54.png',
        '20'
      ],
      [
        'Italizan Drink',
        'https://pngimg.com/uploads/cocktail/cocktail_PNG54.png',
        '40'
      ],
      [
        'California Drink',
        'https://pngimg.com/uploads/cocktail/cocktail_PNG54.png',
        '50'
      ],
      [
        'Chicago Drink',
        'https://pngimg.com/uploads/cocktail/cocktail_PNG54.png',
        '100'
      ],
      [
        'Italizan Drink',
        'https://pngimg.com/uploads/cocktail/cocktail_PNG54.png',
        '50'
      ],
      [
        'California Drink',
        'https://pngimg.com/uploads/cocktail/cocktail_PNG54.png',
        '60'
      ],
    ],
    [
      [
        'Chicago Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '100'
      ],
      [
        'Italizan Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '200'
      ],
      [
        'California Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '200'
      ],
      [
        'Chicago Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '300'
      ],
      [
        'Italizan Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '100'
      ],
      [
        'California Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '100'
      ],
    ],
    [
      [
        'Chicago Cake',
        'https://pngimg.com/uploads/cake/cake_PNG13132.png',
        '100'
      ],
      [
        'Italizan Cake',
        'https://pngimg.com/uploads/cake/cake_PNG13132.png',
        '400'
      ],
      [
        'California Cake',
        'https://pngimg.com/uploads/cake/cake_PNG13132.png',
        '500'
      ],
      [
        'Chicago Cake',
        'https://pngimg.com/uploads/cake/cake_PNG13132.png',
        '200'
      ],
      [
        'Italizan Cake',
        'https://pngimg.com/uploads/cake/cake_PNG13132.png',
        '100'
      ],
      [
        'California Cake',
        'https://pngimg.com/uploads/cake/cake_PNG13132.png',
        '100'
      ],
    ],
    [
      [
        'Chicago Snacks',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '10'
      ],
      [
        'Italizan Snacks',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '20'
      ],
      [
        'California Snacks',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '30'
      ],
      [
        'Chicago Snacks',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '10'
      ],
      [
        'Italizan Snacks',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '10'
      ],
      [
        'California Snacks',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '50'
      ],
    ],
  ];

  final categoryies = [
    {
      'name': 'Burgers',
      'url':
          'https://www.pinclipart.com/picdir/big/522-5223142_hamburger-fast-food-cheeseburger-breakfast-french-fries-transparent.png',
    },
    {
      'name': 'Drinks',
      'url':
          'https://th.bing.com/th/id/R.28bdee9d1b662c5ff5deeee959fd5315?rik=j49LzuuSWTpYUg&riu=http%3a%2f%2fpurepng.com%2fpublic%2fuploads%2flarge%2fpurepng.com-beer-clipartbeerdrinkgoldenfoodgerman-215258853135e4u4.png&ehk=KKFp%2baBZdqzJG4qJaf%2fbsBS1CSmCQRSpq%2fkOfidl%2fzU%3d&risl=&pid=ImgRaw&r=0',
    },
    {
      'name': 'Pizzas',
      'url':
          'https://th.bing.com/th/id/R.dbd56f902d1456752cbf661630184045?rik=MhZuiZVdQu5s4A&riu=http%3a%2f%2fclipart-library.com%2fimages%2fpcoAE74Ri.png&ehk=t8REIGT0t2SXgp5RLoXPWdMW7Vd%2bK7zwUnGoj216vWw%3d&risl=&pid=ImgRaw&r=0',
    },
    {
      'name': 'Cakes',
      'url':
          'https://images.vexels.com/media/users/3/151613/isolated/preview/71680abcac6aa750c99fa2589a48998b-cherry-cake-slice-flat-icon-by-vexels.png',
    },
    {
      'name': 'Snacks',
      'url': 'https://cdn0.iconfinder.com/data/icons/food-2-22/50/67-1024.png',
    },
  ];
}
