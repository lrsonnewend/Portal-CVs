import pandas as pd
import numpy as np 
import csv


#abrindo arquivo csv e fazendo sua leitura
equalsCatalog = open('/home/lucas/Repositorios/Portal-CVs/files asc/singlesRK.csv')   

readerCat = csv.reader(equalsCatalog)

raequalsRK = []
raequalsDS = []
decequalsRK = []
decequalsDS =  []



for k in readerCat:
    raequalsRK.append(k[1].strip())
    decequalsRK.append(k[2].strip())




vetor = []
for i in range(len(raequalsRK)):
    vetor.append(f'query coo {raequalsRK[i]} {decequalsRK[i]} radius = 5s')

vetor = sorted(vetor)

for k in vetor:
    print(k)


    
