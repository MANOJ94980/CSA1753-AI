% diet(Disease, DietType)
diet(diabetes, low_sugar).
diet(bp, low_salt).
diet(obesity, low_fat).
diet(heart, low_cholesterol).
diet(anemia, iron_rich).

% food(DietType, FoodItem)
food(low_sugar, apple).
food(low_sugar, oats).
food(low_sugar, vegetables).

food(low_salt, fruits).
food(low_salt, rice).
food(low_salt, curd).

food(low_fat, salad).
food(low_fat, boiled_vegetables).

food(low_cholesterol, fish).
food(low_cholesterol, nuts).

food(iron_rich, spinach).
food(iron_rich, dates).
food(iron_rich, beetroot).

% Rule to suggest food based on disease
suggest_food(Disease, Food) :-
    diet(Disease, DietType),
    food(DietType, Food).
