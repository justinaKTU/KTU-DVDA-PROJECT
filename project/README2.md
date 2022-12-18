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
-   Run data preparation script from 3-R folder: data_transformation.R

```
git clone https://github.com/kibiras/KTU-DVDA-PROJECT.git
cd KTU-DVDA-PROJECT/3-R
RScript data_transformation.R
```

# Results

-   Random Forest proved to be the best model and reached AUC = 0.78 on training dataset