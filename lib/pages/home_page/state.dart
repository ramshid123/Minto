import 'package:get/get.dart';

class HomePageState {
  var selectedCategoryIndex = 0.obs;
  var name = ''.obs;

  var demoItems = [
    [
      [
        'Cheese Burger',
        'https://th.bing.com/th/id/R.f1143c65fed962eb2335a53ef66dc8f3?rik=Rjj0gCtyr1B%2f6Q&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fburger-transparent%2fburger-transparent-8.png&ehk=%2fzCrhdqli0Q4wsDIEP5ll6yM6yuoIjz8VLZBSmhneII%3d&risl=1&pid=ImgRaw&r=0',
        '50'
      ],
      [
        'Hamburger',
        'https://th.bing.com/th/id/R.66ea739319a660a2a29e23210761bbfa?rik=MEbr1MYORAWtng&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2ftransparent-burger%2ftransparent-burger-11.png&ehk=3WHXW0Sx%2bw%2fnbKQip8xzl30snH5NTxMuTmN4CVoDfuA%3d&risl=&pid=ImgRaw&r=0',
        '20'
      ],
      [
        'Turkey Burger',
        'https://localbiggerburger.com/wp-content/uploads/2019/10/14-144474_turkey-burger-clipart-burger-with-no-background.png',
        '70'
      ],
      [
        'Veggie Burger',
        'https://jloog.com/images/veggie-burger-clipart-transparent-food-2.png',
        '100'
      ],
      [
        'Bean Burger',
        'https://www.burgerking.com.tr/cmsfiles/categories/bean-burger.png?v=176',
        '30'
      ],
      [
        'Chicken Burger',
        'https://th.bing.com/th/id/R.5bdcdb08c533a53cde3be5ba074bb5fb?rik=903CPBsTuFwMfQ&riu=http%3a%2f%2fassets.stickpng.com%2fimages%2f58824b33e81acb96424ffab9.png&ehk=TDBZNFKp0B%2bGSLFK7mUy4a7%2fb5LI%2fbVSHOvYjXgDZXw%3d&risl=&pid=ImgRaw&r=0',
        '100'
      ],
    ],
    [
      [
        'Mango Drink',
        'https://www.pngarts.com/files/4/Juice-PNG-Image-Background.png',
        '20'
      ],
      [
        'Watermelon Cocktail',
        'https://www.dekuyperusa.com/sites/default/files/component_recipes/images/watermelon-mai-tai.png',
        '40'
      ],
      [
        'Lemonade',
        'https://purepng.com/public/uploads/medium/purepng.com-lemonade-drinklemonadedrinksoft-drinklemonlemon-drink-551521126482bgdoq.png',
        '50'
      ],
      [
        'Avocado Shake',
        'https://getthegrove.com/wp-content/uploads/2017/10/creamy-avocado.png',
        '50'
      ],
      [
        'Milk Shake',
        'https://webstockreview.net/images/milkshake-clipart-strawberry-milkshake-19.png',
        '60'
      ],
      [
        'Banana Shake',
        'https://th.bing.com/th/id/R.9f04201c5914c72de061ae8d67f46c9a?rik=L4VBxPbxkIkOzw&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f14%2fCreamy-Banana-Shake-PNG.png&ehk=xqBWl1JNaKNAS4%2f8GZBjvD5E7e4h3cXsDOjlrVc0KQg%3d&risl=&pid=ImgRaw&r=0',
        '100'
      ],
    ],
    [
      [
        'California Pizza',
        'https://freepngimg.com/thumb/pizza/7-pizza-png-image.png',
        '100'
      ],
      [
        'Bagel Pizza',
        'https://www.pngplay.com/wp-content/uploads/2/Top-View-Pizza-Transparent-File.png',
        '200'
      ],
      [
        'Chicken Pizza',
        'https://th.bing.com/th/id/R.f735929a718f6ada1f08ab34730fcf97?rik=%2fYq451%2fsTJv%2bHA&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fpizza-transparent-background%2fpizza-transparent-background-9.png&ehk=VLyqaYb8yrJM759ils61LXdgR9TjjcWeSQtXwcyzshg%3d&risl=1&pid=ImgRaw&r=0',
        '200'
      ],
      [
        'Brick Oven Pizza',
        'https://th.bing.com/th/id/R.66acbd1dd5b8de9cb44f24a790621c6a?rik=5R0TPkBfpLMpww&riu=http%3a%2f%2fwww.pngplay.com%2fwp-content%2fuploads%2f2%2fTop-View-Pizza-Download-Free-PNG.png&ehk=6%2fXwtJi4GTPVFtwrUdDFpZPPLn2cp45ZTvynu1VRoi8%3d&risl=&pid=ImgRaw&r=0',
        '300'
      ],
      [
        'Neapolitan Pizza',
        'https://pngimg.com/uploads/pizza/pizza_PNG7122.png',
        '100'
      ],
      [
        'Sicilian Pizza',
        'https://www.pngkit.com/png/full/4-41052_pizza-png.png',
        '100'
      ],
    ],
    [
      [
        'Chocolate Cake',
        'https://pluspng.com/img-png/png-slice-of-cake--1326.png',
        '100'
      ],
      [
        'Strawberry Cake',
        'https://pluspng.com/img-png/png-slice-of-cake-cheesecake-500.png',
        '400'
      ],
      [
        'Crunch Cake',
        'https://pluspng.com/img-png/png-slice-of-cake--700.png',
        '500'
      ],
      [
        'Cream Cake',
        'https://pluspng.com/img-png/png-slice-of-cake-elizabeth-sponge-cake-400.png',
        '200'
      ],
      [
        'Vanila Cake',
        'https://pluspng.com/img-png/slice-of-cake-png-hd--700.png',
        '100'
      ],
      [
        'Mango Cake',
        'https://pluspng.com/img-png/slice-of-cake-png-hd-png-slice-of-cake-pluspng-com-1680-png-slice-of-cake-1680.png',
        '100'
      ],
    ],
    [
      [
        'Samosa',
        'https://www.pngkit.com/png/full/293-2934357_samosa-png.png',
        '10'
      ],
      [
        'Cutlet',
        'https://th.bing.com/th/id/R.bb932afe4b4ef2b6fc8201b5cd932d2c?rik=qmilCCk0WxsC1g&riu=http%3a%2f%2fpngimg.com%2fuploads%2fcutlet%2fcutlet_PNG23.png&ehk=hS1z%2fPii9QKMZZCOGxa1lh5wc8Lt%2brFavjY%2fj05Q2to%3d&risl=&pid=ImgRaw&r=0',
        '20'
      ],
      [
        'Pazham pori',
        'https://mylocalindian.b-cdn.net/wp-content/uploads/2021/03/Pazham_banana_Pori-removebg-preview.png',
        '30'
      ],
      [
        'Potato Chips',
        'https://pngimg.com/uploads/potato_chips/potato_chips_PNG2.png',
        '10'
      ],
      [
        'Banana Chips',
        'https://toppng.com/public/uploads/thumbnail/banana-chips-1156335805646jyye3gez.png',
        '10'
      ],
      [
        'Bonda',
        'https://modernasopalav.com/assets/images/recipe-image/bonda.png',
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
