## Modificado de Vikram B Baliga: https://www.vikram-baliga.com/blog/2016/1/23/using-r-to-download-genbank-sequences y de Juan C. Santos: http://www.jcsantosresearch.org/Class_2014_Spring_Comparative/pdf/week_2/Jan_13_15_2015_GenBank_part_2.pdf

## Secuencias de ejemplo: Chiasmocleis

##este script necesita un archivo .csv donde informes el nombre que quieres darle a la secuencia y los códigos de GenBank de la secuencia de interés. Es importante uniformizar los nombres de las secuencias para poder concatenarlas después
###en el link de Git-Hub hay un ejemplo de como debe ser el csv

# llamar paquetes
library(ape)
library(seqinr)

sessionInfo() #comprobar que los paquetes cargaron

# definir carpeta de trabajo
setwd()
dir() #revisar archivos en la carpeta de trabajo
#el .csv con los datos deben estar en esta carpeta de trabajo.

# importar archivos .csv
example <- read.csv("example.csv", sep = ";", quote = "\"", head = TRUE, stringsAsFactors = FALSE) #sep puede variar a "," de acuerdo a la configuración del computador
head(example)

## estas líneas seleccionan relaciona las columnas que contienen el código de la secuencia con el nombre que se dará a la secuencia. 

###16s
##filtrar NA
id.16S <- example.frame(example$a16S, example$Seq_name) #match entre códigos de GB y Nombre secuencias
id.16S <- na.omit(id.16S) ##eliminar los nombres de secuencia que no están asociadas a ningún código de GB
GB.16S <- id.16S$example.a16S ##codigos de GB después de eliminar los NA
name.16S <- id.16S$example.Seq_name ##nombres de secuencia después de NA

##bajar secuencias de GB
Chias.16S <- read.GenBank(GB.16S, species.names = F) ##secuencias de GB pero sin el nombre que le dimos
write.dna(Chias.16S, file = "Chias.16S_temp.fasta", format = "fasta", append = F, nbcol = 5, colsep = " ", colw = 10) #creamos archivo temporal.
Chias.16S.temp <- read.fasta(file = "Chias.16S_temp.fasta", seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE) #cargamos archivo temporal
write.fasta(sequences = Chias.16S.temp, names = name.16S, nbchar = 10, file.out = "Chiasmocleis_16S.fasta")

###COI
##puedes pegar el script en notepad++ y cambiar estos parámetros
#a16S --> COI
#16S --> COI
##y repetir el proceso según los marcadores que tengas, recuerda que esto está relacionado al nombre que pusiste en el archivo .csv

id.COI <- example.frame(example$COI, example$Seq_name)
id.COI <- na.omit(id.COI)
GB.COI <- id.COI$example.COI
name.COI <- id.COI$example.Seq_name

Chias.COI <- read.GenBank(GB.COI, species.names = F)
write.dna(Chias.COI, file = "Chias.COI_temp.fasta", format = "fasta", append = F, nbcol = 5, colsep = " ", colw = 10)
Chias.COI.temp <- read.fasta(file = "Chias.COI_temp.fasta", seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE)
write.fasta(sequences = Chias.COI.temp, names = name.COI, nbchar = 10, file.out = "Chiasmocleis_COI.fasta")

### BDNF
#COI --> BDNF

id.BDNF <- example.frame(example$BDNF, example$Seq_name)
id.BDNF <- na.omit(id.BDNF)
GB.BDNF <- id.BDNF$example.BDNF
name.BDNF <- id.BDNF$example.Seq_name

Chias.BDNF <- read.GenBank(GB.BDNF, species.names = F)
write.dna(Chias.BDNF, file = "Chias.BDNF_temp.fasta", format = "fasta", append = F, nbcol = 5, colsep = " ", colw = 10)
Chias.BDNF.temp <- read.fasta(file = "Chias.BDNF_temp.fasta", seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE)
write.fasta(sequences = Chias.BDNF.temp, names = name.BDNF, nbchar = 10, file.out = "Chiasmocleis_BDNF.fasta")

### TYR
#BDNF --> TYR
id.TYR <- example.frame(example$TYR, example$Seq_name)
id.TYR <- na.omit(id.TYR)
GB.TYR <- id.TYR$example.TYR
name.TYR <- id.TYR$example.Seq_name

Chias.TYR <- read.GenBank(GB.TYR, species.names = F)
write.dna(Chias.TYR, file = "Chias.TYR_temp.fasta", format = "fasta", append = F, nbcol = 5, colsep = " ", colw = 10)
Chias.TYR.temp <- read.fasta(file = "Chias.TYR_temp.fasta", seqtype = "DNA", as.string = TRUE, forceDNAtolower = FALSE)
write.fasta(sequences = Chias.TYR.temp, names = name.TYR, nbchar = 10, file.out = "Chiasmocleis_TYR.fasta")

## para citar paquetes y al R usar el comando: citation()
##link git-hub https://github.com/orojas91/Secuencias-Genbank-con-R
