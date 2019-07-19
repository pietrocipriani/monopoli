final static HashMap roadsData = new HashMap<String, HashMap>();
final static HashMap groupsCount = new HashMap<Integer, Integer>();
static {
  roadsData.put("VICOLO CORTO", new HashMap(){{
    put("group", FUCSIA_GROUP);
    put("price", 6000);
    put("rent", 200);
    put("rent_1house", 1000);
    put("rent_2house", 3000);
    put("rent_3house", 9000);
    put("rent_4house", 16000);
    put("rent_hotel", 25000);
    put("price_house", 5000);
    put("price_hotel", 5000);
  }});
  roadsData.put("VICOLO STRETTO", new HashMap(){{
    put("group", FUCSIA_GROUP);
    put("price", 6000);
    put("rent", 400);
    put("rent_1house", 2000);
    put("rent_2house", 6000);
    put("rent_3house", 18000);
    put("rent_4house", 32000);
    put("rent_hotel", 45000);
    put("price_house", 5000);
    put("price_hotel", 5000);
  }});
  roadsData.put("BASTIONI GRAN SASSO", new HashMap(){{
    put("group", CYAN_GROUP);
    put("price", 10000);
    put("rent", 600);
    put("rent_1house", 3000);
    put("rent_2house", 9000);
    put("rent_3house", 27000);
    put("rent_4house", 40000);
    put("rent_hotel", 55000);
    put("price_house", 5000);
    put("price_hotel", 5000);
  }});
  roadsData.put("VIALE MONTEROSA", new HashMap(){{
    put("group", CYAN_GROUP);
    put("price", 10000);
    put("rent", 600);
    put("rent_1house", 3000);
    put("rent_2house", 9000);
    put("rent_3house", 27000);
    put("rent_4house", 40000);
    put("rent_hotel", 55000);
    put("price_house", 5000);
    put("price_hotel", 5000);
  }});
  roadsData.put("VIALE VESUVIO", new HashMap(){{
    put("group", CYAN_GROUP);
    put("price", 12000);
    put("rent", 8000);
    put("rent_1house", 4000);
    put("rent_2house", 10000);
    put("rent_3house", 30000);
    put("rent_4house", 45000);
    put("rent_hotel", 60000);
    put("price_house", 5000);
    put("price_hotel", 5000);
  }});
  roadsData.put("VIA ACCADEMIA", new HashMap(){{
    put("group", ORANGE_GROUP);
    put("price", 14000);
    put("rent", 1000);
    put("rent_1house", 5000);
    put("rent_2house", 15000);
    put("rent_3house", 45000);
    put("rent_4house", 62000);
    put("rent_hotel", 75000);
    put("price_house", 10000);
    put("price_hotel", 10000);
  }});
  roadsData.put("CORSO ATENEO", new HashMap(){{
    put("group", ORANGE_GROUP);
    put("price", 14000);
    put("rent", 1000);
    put("rent_1house", 5000);
    put("rent_2house", 15000);
    put("rent_3house", 45000);
    put("rent_4house", 62000);
    put("rent_hotel", 75000);
    put("price_house", 10000);
    put("price_hotel", 10000);
  }});
  roadsData.put("PIAZZA UNIVERSITA'", new HashMap(){{
    put("group", ORANGE_GROUP);
    put("price", 16000);
    put("rent", 12000);
    put("rent_1house", 6000);
    put("rent_2house", 18000);
    put("rent_3house", 50000);
    put("rent_4house", 70000);
    put("rent_hotel", 90000);
    put("price_house", 10000);
    put("price_hotel", 10000);
  }});
  roadsData.put("VIA VERDI", new HashMap(){{
    put("group", BROWN_GROUP);
    put("price", 18000);
    put("rent", 1400);
    put("rent_1house", 7000);
    put("rent_2house", 20000);
    put("rent_3house", 55000);
    put("rent_4house", 75000);
    put("rent_hotel", 95000);
    put("price_house", 10000);
    put("price_hotel", 10000);
  }});
  roadsData.put("CORSO RAFFAELLO", new HashMap(){{
    put("group", BROWN_GROUP);
    put("price", 18000);
    put("rent", 1400);
    put("rent_1house", 7000);
    put("rent_2house", 20000);
    put("rent_3house", 55000);
    put("rent_4house", 75000);
    put("rent_hotel", 95000);
    put("price_house", 10000);
    put("price_hotel", 10000);
  }});
  roadsData.put("PIAZZA DANTE", new HashMap(){{
    put("group", BROWN_GROUP);
    put("price", 20000);
    put("rent", 1600);
    put("rent_1house", 8000);
    put("rent_2house", 22000);
    put("rent_3house", 60000);
    put("rent_4house", 80000);
    put("rent_hotel", 100000);
    put("price_house", 10000);
    put("price_hotel", 10000);
  }});
  roadsData.put("VIA MARCO POLO", new HashMap(){{
    put("group", RED_GROUP);
    put("price", 22000);
    put("rent", 1800);
    put("rent_1house", 9000);
    put("rent_2house", 25000);
    put("rent_3house", 70000);
    put("rent_4house", 88000);
    put("rent_hotel", 105000);
    put("price_house", 15000);
    put("price_hotel", 15000);
  }});
  roadsData.put("CORSO MAGELLANO", new HashMap(){{
    put("group", RED_GROUP);
    put("price", 22000);
    put("rent", 1800);
    put("rent_1house", 9000);
    put("rent_2house", 25000);
    put("rent_3house", 70000);
    put("rent_4house", 88000);
    put("rent_hotel", 105000);
    put("price_house", 15000);
    put("price_hotel", 15000);
  }});
  roadsData.put("LARGO COLOMBO", new HashMap(){{
    put("group", RED_GROUP);
    put("price", 24000);
    put("rent", 2000);
    put("rent_1house", 10000);
    put("rent_2house", 30000);
    put("rent_3house", 75000);
    put("rent_4house", 90000);
    put("rent_hotel", 110000);
    put("price_house", 15000);
    put("price_hotel", 15000);
  }});
  roadsData.put("VIALE COSTANTINO", new HashMap(){{
    put("group", YELLOW_GROUP);
    put("price", 26000);
    put("rent", 2200);
    put("rent_1house", 11000);
    put("rent_2house", 33000);
    put("rent_3house", 80000);
    put("rent_4house", 100000);
    put("rent_hotel", 120000);
    put("price_house", 15000);
    put("price_hotel", 15000);
  }});
  roadsData.put("VIALE TRAIANO", new HashMap(){{
    put("group", YELLOW_GROUP);
    put("price", 26000);
    put("rent", 2200);
    put("rent_1house", 11000);
    put("rent_2house", 33000);
    put("rent_3house", 80000);
    put("rent_4house", 100000);
    put("rent_hotel", 120000);
    put("price_house", 15000);
    put("price_hotel", 15000);
  }});
  roadsData.put("PIAZZA GIULIO CESARE", new HashMap(){{
    put("group", YELLOW_GROUP);
    put("price", 28000);
    put("rent", 2400);
    put("rent_1house", 12000);
    put("rent_2house", 36000);
    put("rent_3house", 85000);
    put("rent_4house", 105000);
    put("rent_hotel", 125000);
    put("price_house", 15000);
    put("price_hotel", 15000);
  }});
  roadsData.put("VIA ROMA", new HashMap(){{
    put("group", GREEN_GROUP);
    put("price", 30000);
    put("rent", 2600);
    put("rent_1house", 13000);
    put("rent_2house", 40000);
    put("rent_3house", 90000);
    put("rent_4house", 110000);
    put("rent_hotel", 130000);
    put("price_house", 20000);
    put("price_hotel", 20000);
  }});
  roadsData.put("CORSO IMPERO", new HashMap(){{
    put("group", GREEN_GROUP);
    put("price", 30000);
    put("rent", 2600);
    put("rent_1house", 13000);
    put("rent_2house", 40000);
    put("rent_3house", 90000);
    put("rent_4house", 110000);
    put("rent_hotel", 130000);
    put("price_house", 20000);
    put("price_hotel", 20000);
  }});
  roadsData.put("LARGO AUGUSTO", new HashMap(){{
    put("group", GREEN_GROUP);
    put("price", 32000);
    put("rent", 2800);
    put("rent_1house", 15000);
    put("rent_2house", 45000);
    put("rent_3house", 100000);
    put("rent_4house", 120000);
    put("rent_hotel", 140000);
    put("price_house", 20000);
    put("price_hotel", 20000);
  }});
  roadsData.put("VIALE DEI GIARDINI", new HashMap(){{
    put("group", PURPLE_GROUP);
    put("price", 35000);
    put("rent", 3500);
    put("rent_1house", 20000);
    put("rent_2house", 50000);
    put("rent_3house", 110000);
    put("rent_4house", 130000);
    put("rent_hotel", 150000);
    put("price_house", 20000);
    put("price_hotel", 20000);
  }});
  roadsData.put("PARCO DELLA VITTORIA", new HashMap(){{
    put("group", PURPLE_GROUP);
    put("price", 40000);
    put("rent", 5000);
    put("rent_1house", 20000);
    put("rent_2house", 60000);
    put("rent_3house", 140000);
    put("rent_4house", 170000);
    put("rent_hotel", 200000);
    put("price_house", 20000);
    put("price_hotel", 20000);
  }});
  groupsCount.put(FUCSIA_GROUP, 2);
  groupsCount.put(CYAN_GROUP, 3);
  groupsCount.put(ORANGE_GROUP, 3);
  groupsCount.put(BROWN_GROUP, 3);
  groupsCount.put(RED_GROUP, 3);
  groupsCount.put(YELLOW_GROUP, 3);
  groupsCount.put(GREEN_GROUP, 3);
  groupsCount.put(PURPLE_GROUP, 2);
}





final Box[][] boxes = new Box[][]{
  {
    new StartBox(),
    new RoadBox("VICOLO CORTO"),
    new ProbChanceBox(ProbChance.PROBABILITY),
    new RoadBox("VICOLO STRETTO"),
    new NullBox(),
    new StationBox(Direction.SUD),
    new RoadBox("BASTIONI GRAN SASSO"),
    new ProbChanceBox(ProbChance.CHANCE),
    new RoadBox("VIALE MONTEROSA"),
    new RoadBox("VIALE VESUVIO"),
  },
  {
    new JailBox(),
    new RoadBox("VIA ACCADEMIA"),
    new SocietyBox(Society.ELECTRICITY),
    new RoadBox("CORSO ATENEO"),
    new RoadBox("PIAZZA UNIVERSITA'"),
    new StationBox(Direction.OVEST),
    new RoadBox("VIA VERDI"),
    new ProbChanceBox(ProbChance.PROBABILITY),
    new RoadBox("CORSO RAFFAELLO"),
    new RoadBox("PIAZZA DANTE"),
  },
  {
    new ParkingBox(),
    new RoadBox("VIA MARCO POLO"),
    new ProbChanceBox(ProbChance.CHANCE),
    new RoadBox("CORSO MAGELLANO"),
    new RoadBox("LARGO COLOMBO"),
    new StationBox(Direction.NORD),
    new RoadBox("VIALE COSTANTINO"),
    new RoadBox("VIALE TRAIANO"),
    new SocietyBox(Society.WATER),
    new RoadBox("PIAZZA GIULIO CESARE"),
  },
  {
    new ToJailBox(),
    new RoadBox("VIA ROMA"),
    new RoadBox("CORSO IMPERO"),
    new ProbChanceBox(ProbChance.PROBABILITY),
    new RoadBox("LARGO AUGUSTO"),
    new StationBox(Direction.EST),
    new ProbChanceBox(ProbChance.CHANCE),
    new RoadBox("VIALE DEI GIARDINI"),
    new NullBox(),
    new RoadBox("PARCO DELLA VITTORIA"),
  }
};
