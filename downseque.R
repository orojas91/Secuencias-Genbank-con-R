## Modificado de Vikram B Baliga: https://www.vikram-baliga.com/blog/2016/1/23/using-r-to-download-genbank-sequences y de Juan C. Santos: http://www.jcsantosresearch.org/Class_2014_Spring_Comparative/pdf/week_2/Jan_13_15_2015_GenBank_part_2.pdf

## Secuencias de ejemplo: Ctenophryne

# llamar paquetes
library(ape)
library(seqinr)

sessionInfo() #comprobar que los paquetes cargaron

# definir carpeta de trabajo
setwd("D:/tu carpeta de trabajo")
dir() #revisar archivos en la carpeta de trabajo

# importar archivos .csv
cten <- read.csv("example.csv", sep = ";", quote = "\"", head = TRUE, stringsAsFactors = FALSE)
#el sep = ";" puede cambiarse por ",". Esto depende de la configuración del computador con respecto a qué caracter usa como separador de columnas en el csv.

#### BAJAR SECUENCIAS

##16S

#bajar secuencias
cten.16<-read.GenBank(cten$X16S,species.names=T)
#Definir nombre de archivos para fasta final
cten.16.id <- paste(attr(cten.16, "species"), cten$Museo, sep = "_")
#crear primer archivo fasta
write.dna(cten.16, file ="cten.16_temp.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10)
##cargar primer fasta
cten.16.temp <- read.fasta(file = "cten.16_temp.fasta", seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE)
#reescribir fasta
write.fasta(sequences = cten.16.temp, names = cten.16.id, nbchar = 10, file.out = "Ctenophryne_16S.fasta")

## BAJAR COI
#como esta secuencia tiene NA, primero se tiene que eliminar.

#########################eliminar NA en tabla
#1. Separar columnas de GEN y TOMBO
id.coi <- data.frame(cten$COI, cten$Museo)
#2. Eliminar NA en TOMBO y GEN
id.coi <- na.omit(id.coi)
#############################################

cten.coi <- read.GenBank(id.coi$cten.COI,species.names=T)
cten.coi.id <- paste(attr(cten.coi, "species"), id.coi$cten.Museo, sep = "_")
write.dna(cten.coi, file ="cten.coi_temp.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) ## BIEN BAJADO
cten.coi.temp <- read.fasta(file = "cten.coi_temp.fasta", seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE)
write.fasta(sequences = cten.coi.temp, names = cten.coi.id, nbchar = 10, file.out = "Ctenophryne_COI.fasta")

