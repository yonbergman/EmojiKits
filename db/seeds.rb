star_wars = Kit.where(name: 'Star Wars').first_or_create
Emoji.where(kit: star_wars, name: 'Vader', image: '/assets/vader.png').first_or_create
Emoji.where(kit: star_wars, name: 'Luke', image: '/assets/vader.png').first_or_create
Emoji.where(kit: star_wars, name: 'yoda', image: '/assets/vader.png').first_or_create