## Caloricator
Java swing and mysql based GUI application that helps to track daily calorie consumption and helps user to lose, maintain or gain weight.

### Abbreviations
 1.  <b>BMR</b>  
      * Basal Metabolic Rate is the amount of energy a human body uses when it is completely at rest. It's the amount of energy your body needs to support its vital functions: breathing, blood circulation, controlling body temperature, brain and nerve functions to name a few. The organs that use the most energy at rest are the brain, the central nervous system and the liver. What's interesting is that, throughout the day, more energy is consumed by the regulation of fluid volumes and ion levels than in the actual mechanical work of contracting muscles
      
 2. <b>BMI</b>  
     * The BMI is a convenient rule of thumb used to broadly categorize a person as underweight, normal weight, overweight, or obese based on tissue mass (muscle, fat, and bone) and height. That categorization is the subject of some debate about where on the BMI scale the dividing lines between categories should be placed Commonly accepted BMI ranges are underweight (under 18.5 kg/m<sup>2</sup>), normal weight (18.5 to 25), overweight (25 to 30), and obese (over 30)

### Important formulas

1. #### BMI  
        BMI = (weight/height^2)*10000

2. #### Mifflin-st jeor equation for calculating BMR for men  
        BMR = [((10 x weight)+(6.25 x height)-(5 x age + 5))] 

3. #### Mifflin-st jeor equation for calculating BMR for women  
        BMR = [((10 x weight)+(6.25 x height)-(5 x age - 161))]
### Features
#### Admin features
   Admin have the privileges to manage food and user database with the following database operations 
   1. Create
   2. Read 
   3. Update
   4. delete

#### User features
   Users have the following options
   1. Signup
      * User will be asked for personal information which includes his activity level and food habit along with other details. 
   2. Signin
      * User can sign in using the ID and the password.
   3. Signout
      * User can logout at the end.
   3. Edit profile
      * User can make changes to his personal data.
   4. BMI calculator
      * User can calculate Body Mass Index
   5. BMR calculator
      * User can check amount of calories needed to be consumed to achieve their goal of losing, maintaining or gaining weight.
   6. Calorie calculator
      * User can calculate the calories in a selected food of given quantity.
   7. suggestion Box
      * User will be suggested a unique combination of random 3 foods based on his food habits daily.
   8. Tracker
      * User can write or update data like height, weight and calorie consumed and visualise using a 2D graph.


#### Database structure  
├── Admin  
│   └─> Columns  
│	      ├─> ID  
│	      └─> Password  
│  
├── Habits  
│   └─> Columns  
│	      ├─> User ID  
│	      ├─> type (possible values are vegan, vegetarian and non vegetarian)  
│	      ├─> Exercise (possible values are sedentary, normal, active and very active)  
│	      └─> wants to (indicates user interest to lose, maintain or gain weight)  
│  
├── User  
│   └─> Columns  
│	      ├─> Name  
│	      ├─> Email  
│	      ├─> Age  
│	      ├─ Height  
│	      ├─> weight  
│	      ├─> phone  
│	      ├─> photo  
│	      └─> sex  
│  
├── History  
│   ├─> Columns  
│	  │   ├─> User ID  
│	  │   ├─> food1  
│	  │   ├─> food2  
│	  │   ├─> food3  
│	  │   └─> date  
│   └─> Trigger  
│	      └─> Deletes 7 day old entires after insert  
│  
├── Login  
│   └─> Columns  
│	      ├─> User ID  
│	      └─> Password  
│  
├── Tracker  
│   ├─> Columns  
│	  │   ├─> User ID  
│	  │   ├─> height  
│	  │   ├─> weight  
│	  │   ├─> total_calories  
│	  │   └─> date  
│   └─> Trigger  
│	      └─> Deletes 30 day old entires after insert  
│  
├── vegetables-and-fruits  
│   └─> Columns  
│	      ├─> id  
│	      ├─> Name  
│	      ├─> Amount  
│       └─> Calories  
│   
├── Nonveg  
│   └─> Columns  
│	      ├─> id  
│	      ├─> Name  
│	      ├─> Amount  
│       └─> Calories  
│    
└── snacks  
    └─> Columns  
	      ├─> id  
	      ├─> Name  
	      ├─> Amount  
        └─> Calories  



