// LIBRARIES

// GLOBAL VARIABLES
PShape map;
String[] meteorStrikeData;
String[][] data;
// SETUP
void setup()
{
  size(1800, 900);
  noLoop(); // tells processing to run draw() only once
  map = loadShape("WorldMap.svg");
  
  // Import CSV Data
  meteorStrikeData = loadStrings("MeteorStrikes.csv");
  data = new String[meteorStrikeData.length][6];
  for (int i = 0; i < meteorStrikeData.length; i++)
  {
    data[i] = meteorStrikeData[i].split(","); // Separate with comma delimmeter 
  }
}

// DRAW
void draw()
{
  
  
}
