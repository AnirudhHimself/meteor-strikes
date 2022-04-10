import processing.pdf.*;

PShape map;
String[] meteorStrikeData;
String[][] data;
PFont font;

// Run once 
void setup()
{
  size(1800, 900);
  noLoop(); // tells processing to run draw() only once
  map = loadShape("WorldMap.svg");
  font = createFont("Avenir-Medium", 14);
  
  // Import CSV Data
  meteorStrikeData = loadStrings("MeteorStrikes.csv");
  data = new String[meteorStrikeData.length][6];
  for (int i = 0; i < meteorStrikeData.length; i++)
  {
    data[i] = meteorStrikeData[i].split(","); // Separate with comma delimmeter 
  }
}

// Would typically run at some specified FPS, but we've configured this to not run in
// a loop in the setup.
void draw()
{
  beginRecord(PDF, "meteorstrikes.pdf");
  shape(map, 0, 0, width, height);
  noStroke();
  textMode(MODEL);
  
  // Adding Circles Proportional to the Size of Meteorite Strike
  for (int i = 1; i < data.length; i++)
  {
    fill(173, 155, 170, 60); // Kind of a purple #AD9BAA
    noStroke();
    
    // Use equirectangular projection
    float longitude = map(float(data[i][3]), -180, 180, 0, width);
    float lattitude = map(float(data[i][4]), -90, 90, height, 0);
    float markerSize = 0.05 * sqrt(float(data[i][2]) / PI); // Area proportional to mass
    ellipse(longitude, lattitude, markerSize, markerSize);
    // Add Labels for top 20 meteors
    if (i < 20)
    {
      fill(0);
      textFont(font);
      text(data[i][0], longitude + markerSize + 5, lattitude + 4);
      noFill(); // I don't want a fill on the line
      stroke(0);
      line(longitude + markerSize * 0.5, lattitude, longitude + markerSize, lattitude);
    }
  }
  endRecord();
}
