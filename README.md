# Secuencias-Genbank-con-R
Código en R para descargar secuencias de ADN disponibles en GenBank.

Ya existen códigos para descargar secuencias de GB, lo que este hace es facilitar la vida para bajar varios fragmentos --> asociarlos a un nombre que escojas. Debido a que no siempre el mismo individuo posee todos los marcadores de interés, agregas "NA" en donde sea necesario, esto posteriormente ayudará a filtrar la base de datos y asociar el fragmento del GB adecuadamente al nombre de la secuencia.

Archivos necesarios:

1. un .csv con los códigos de acceso de GenBank y nombre escogido parala secuencia, columna: Seq_name del .csv
-- Los códigos de GB es útil para indicar la secuencia exacta que deseas. Puedes ordenar por Columna por fragmento como indicado en el .csv
-- el Seq_name: nombre que se agregará a la secuencia bajada. En mi caso, uso el nombre de las especie + código de colección.

2. El script de R.

Si lo ejecutaron correctamente tendrán estos archivos en la carpeta de trabajo:
- COI_temp.fasta: archivo temporal con las secuencias, pueden borrar esto después.
- COI.fasta: archivo definitivo con las secuencias nombradas.


Siéntase libres de comentar o sugerir mejoras.
:)
