data<-Sistem_Pembayaran_Triwulan_Tahun_2021
attach(data)
library(cluster)
library(factoextra)
library(tidyverse)
data<-Sistem_Pembayaran_Triwulan_Tahun_2021
dataku<-data[,-1]
view(dataku)
#melihat deskripsi data
summary(data)
#melakukan transformasi
data1<-scale(data[,2:11])
view(data1)
fviz_nbclust(data,kmeans,method = "wss")
#menentukan jumlah cluster terbaik metode silhoutte
fviz_nbclust(data1,kmeans)
#menentukan cluster dengan metode k-means
final<-kmeans(data1,5)
print(final)
#melihat hasil clustering bentuk rafik/visual
fviz_cluster(final,data=data1)
#melihat hasil cluster dalam bentuk tabel
final1<-data.frame(data1,final$cluster)
view(final1)
distance<-dist(final1)
hc.c<-hclust(distance,method = "average")
plot(hc.c)
