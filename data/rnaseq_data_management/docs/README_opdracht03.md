# README RNA-seq data management

Deze mapstructuur is gemaakt volgens de Guerilla Analytics principes voor data management voor 
de RNA-sequencing formatieve opdracht van de DAUR2 module.

## Mapstructuur

- data/raw: bevat lege FASTQ-bestanden met dezelfde naam als de ruwe data
- data/processed: bevat lege BAM-bestanden met dezelfde naam als de verwerkte data
- data/counts: bevat het count-bestand
- scripts: bevat scripts die in de analyse worden gebruikt
- results: bevat outputbestanden zoals FastQC html-bestanden en afbeeldingen
- docs: bevat documentatie, waaronder deze README

## Opmerking

De echte bestanden zijn niet van de server gedownload. 
In plaats daarvan zijn lege bestanden aangemaakt met dezelfde naam als de bestanden op de server, 
zoals gevraagd in de opdracht.