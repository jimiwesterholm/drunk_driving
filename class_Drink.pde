class Drink {
  int bodyWeight;  //body weight in kg
  float bwcM;  //body water constant male
  float bwcW;  //body water constant female
  float mcM;  //metabolism constant male
  float mcW;  //metabolism constant female
  float limit;  //DUI limit
  int wait;  //how many hours waited after drinking
  float standardDrinkM;  //estimated amout of standard drinks that can be had (male)
  float standardDrinkW;  //estimated amout of standard drinks that can be had (female)
  
  /**
  * Constructor
  * 
  * @param None
  * @return None
  */
  Drink()  {
    bodyWeight = 70;  //body weight in kg
    bwcM = 0.58;  //body water constant male
    bwcW = 0.49;  //body water constant female
    mcM = 0.015;  //metabolism constant male
    mcW = 0.017;  //metabolism constant female
    limit = 0.05;  //DUI limit
    wait = 0;  //how many hours waited after drinking
    standardDrinkM = (((limit + wait * mcM) * bodyWeight * bwcM) / 0.9672) / 0.79;  //estimated amout of standard drinks that can be had (male)
    standardDrinkW = (((limit + wait * mcW) * bodyWeight * bwcW) / 0.9672) / 0.79;  //estimated amout of standard drinks that can be had (female)
  }
  
  /**
  * Method for getting standard drink values
  * 
  * @param None
  * @return standardDrinkM
  */
  public float getStandardDrink(boolean genderTest)
  {
    if (genderTest == true)
    {
      return(standardDrinkM);
    }
    else
    {
      return(standardDrinkW);
    }
  }
  
  
  /**
  * Method for changing variables
  * 
  * @param Tons
  * @return None
  */
  public void changeVar(int weight, int waitTime, float limitTest){
    bodyWeight = weight;
    wait = waitTime;
    limit = limitTest;
    standardDrinkM = (((limit + wait * mcM) * bodyWeight * bwcM) / 0.9672) / 0.79;
    standardDrinkW = (((limit + wait * mcW) * bodyWeight * bwcW) / 0.9672) / 0.79;
  }
  
  
}
