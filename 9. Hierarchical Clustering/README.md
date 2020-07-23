# 12. Hierarchical Clustering

* What is Clustering ? organize the observations based on their similarity.
* Key Important for "Clustering" :
  1. How do we Define "CLOSE"
  2. How do we Group thing
  3. How do we visualize the grouping
  4. How Do we interpret the grouping

## 12.1 Hierarchical clustering
- Organizing your data into a kind of hierarchy
Algorithms Recursively :
  - Find the observation with higher similarity.I.e observation close together
  - Merge those Observation
  - Repeat.
## 12.2 - 12.4 How do we define Close
 - here's a few number metrics for characterizing distance similarity :
  1. Euclidean distance : np.sqrt(d(feature1)^2 + d(feature2)^2 ... + d(features3)) where d--> difference between observation in feature n
  More like hypothenuse in pythogoras
  2. Correlation similarity : pearson Correlation ?
  3. Manhattan distance : np.abs(d(feature1)) + np.abs(d(feature2)) + np.abs(d(featuren))
- How To Choose ? I dont know yet, but i prefer using Manhattan Distance ,but still we need to practice it.

## 12.5 Example : Hierarchical Clustering.
- Code , [Incoming]()

## 12.6 Prettier dendograms
- Code , honestly this make sense ,but the code make my head crazy..

## 12.7  - 12. 8 Merging points
 - When there is a new observation how we define it/merge it ? 3 ways:
   1. Further --> find the further distance in each cluster --> complete Linkage
   2. Closest --> find the closest distance in each cluster --> single linkage
   3. Average --> average distance in each cluster and find the minima --> often called Centroid

#12.9 Using the heatmap() function
 - you get a dendrogram associated with both the rows and columns of a matrix,
 More easy than Hierarchical.

 --[Code]()
## 12.10 summary
Hierarchical clustering is a really useful tool because it quickly gives you an idea of the relationships between variables/observations. But caution should be used with clustering as often the picture that you produce can be unstable. In particular,
 it may be sensitive to Hierarchical Clustering :
- Changing a few points in the dataset <<TRUE ,we see 1 and 3 right>>
- Having different missing values in some of the observations
- Picking a different distance metric (i.e. Euclidean vs. Manhattan) <TRUE See The code , i make your life easier :D>
- Changing the merging strategy (i.e. complete vs. average) <TRUE "Single,complete,centroid">
- Changing the scale of points for one variable <<SCALING IS IMPORTANT >>
