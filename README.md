FATSECRET GEM
=============

Introduction
------------

Access nutritional information from FatSecret. You need to register with FatSecret to get
a key and secret. At the moment you can search for food and get its nutritional information,
however FatSecret provides much more then that, which has not been implemented in this gem.

Useage
------

To use it tell the gem your authentication details:

		FatSecret.init(FATSECRET_KEY,FATSECRET_SECRET)

Search for food, use the following:

		FatSecret.search_food('milk')

To get nutritional information for food you found through food search, you have to provide
the food method with the food id:

		FatSecret.food(800)

CONTRIBUTIONS
-------------

Any contributions to improve this gem are welcomed.
