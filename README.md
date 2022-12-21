# Motivation

Help business to classify bad customers and to minimize default rates by creating ML model based app. 
App can be used by any credit (lending) company which issue consumer credits. 
App is easy to use. 

# Dependencies

-   R kernel
-   R packages: h2o, shiny, tidyverse, shinythemes

```
install.packages("h2o")
install.packages("shiny")
install.packages("tidyverse")
install.packages("shinythemes")
install.packages("ggplot2")
```

# Directory structure

```

        ├───1-data
        ├───2-report
        ├───3-R
        ├───4-model
        ├───5-predictions
        └───app
```

# How to execute code

-   Download data from 1-data folder
-   Run data preparation script from 3-R folder - data_transformation.R
-   Run script for best model training from 3-R folder - modelling.R
-   Run app from app folder app - app.R
-   Upload .csv format document into app and wait for the results

```
git clone https://https://github.com/justinaKTU/KTU-DVDA-PROJECT.git
cd KTU-DVDA-PROJECT/project/3-R
RScript data_transformation.R
RScrip modelling.R
cd ..
cd app
RScript app.R
```

# Results

-   Gradient Boosting Machines (GBM) proved to be the best model and reached AUC = 0.791 on training dataset

# App 

![](https://github.com/justinaKTU/KTU-DVDA-PROJECT/blob/main/project/app/Shiny%20app.PNG)