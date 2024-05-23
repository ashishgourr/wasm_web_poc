class Item {
  String image;
  String title;
  String subtitle;
  String description;
  String price;

  Item({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
  });
}

List<Item> items = [
  Item(
    image:
        'https://images.unsplash.com/photo-1612183515105-8c737ba7585d?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Espresso',
    subtitle: 'Lorem ipsum dolor sit amet blanditiis',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
    price: '\$56-\$45',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1580661869408-55ab23f2ca6e?q=80&w=2535&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Americano',
    subtitle: 'Lorem ipsum dolor sit amet blanditiis',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
    price: '\$56-\$45',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1485808191679-5f86510681a2?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Macchiato',
    subtitle: 'Lorem ipsum dolor sit amet blanditiis',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
    price: '\$56-\$45',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1572097662444-003d63fe5884?q=80&w=2535&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Latte',
    subtitle: 'Lorem ipsum dolor sit amet blanditiis',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
    price: '\$56-\$45',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Cappuccino',
    subtitle: 'Lorem ipsum dolor sit amet blanditiis',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
    price: '\$56-\$45',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1621555470436-d36e9683bae5?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Black Coffee',
    subtitle: 'Lorem ipsum dolor sit amet blanditiis',
    description:
        'Lorem ipsum dolor sit amet. Vel blanditiis modi eos accusamus cupiditate ut sint quaerat.',
    price: '\$56-\$45',
  ),
];
