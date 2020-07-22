# 15. The ggplot2 Plotting system : Part 1

- [LinkToCode]()
### Corresponding Code for this Section
- The Implementation *"The Grammar of Graphics"* Books
- Base Graphics + lattice System = ggplot2
“…the grammar tells us that a statistical graphic is a mapping from data to
aesthetic attributes (colour, shape, size) of geometric objects (points, lines,bars). The plot may also contain statistical transformations of the data and is drawn on a specific coordinate system” – from ggplot2 book
- The Important thing in this ggplot2:
  - aes --> colour , size , shape <Using Variables/Features>
  - geom --> bars , points ,lines
  - + --> adding another another things to graphic
- ggplot2 often more flexible , try to master it :D .  

## 15.1 The basics : qplot()
 - Make your work more fast , often you want to know what your data is/are.
 - qplot() is hiding the low level of visualization
 - qplot() also can do Lattice and Base Graphics but you dont have much control on annotation :D
 - Factor play Important Role , Factor mean categorical Variable.

## 15.2 before you Start: Label yOur Data (this is not machine learning ,label here mean "variable name/column name / whatever its")
- Make sure your categorical varible/factor is Informative and descriptive names.
- it's worth enough when you making sure your variable / factor descriptive and concise.

## 15.3 ggplot2 "Hello World"
 - This Section just plotting in ggplot2 , check out the code.

## 15.4 Modifying aesthetics
 - This Section just add a color to observation by using a variable,that's it.

## 15.5 Adding Geom
- this Section just covers how to add geoms and use it ,because we need to explictly write it down :D

## 15.6 Histogram
 - This Section covers how to create Histogram and boxplot
 - it show that ggplot2 can be used plot 1-dimensional data
## 15.7 Facets
 - Remember Conditional ? yep ,Lattice system , this facets make it easy.
 - Factor() Remember that variables ,because that's its make our plots informative.
 - facets = row ~ columns . if you specify (. ~ var) then its going to build up your plots based on columns , col 1 ,2  ,3 ,vice versa.


## 15.8 i Cant the data set , so m going to use existing data set.
 - Btw What i found from here:
  - Make Faster plot and insightful
  - Easy to use ,Really easy
  - More powerful Plots
  - The Arguments is nearly same as base system,just a few changes ,such as pch is changed to shape ,its convenient to use. btw arguments such as col,shape its by default a constant ,but if we specified that using variables it's not going to act as constant.
  - I already demonstrate it ,cehck the CoDEs

## 15.9 Summary
In Summary it's just plotting data fast and dirty :D
