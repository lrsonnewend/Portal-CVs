'''
INFORMAÇÕES GERAIS DOS CATÁLOGOS:
    Versões:
       Downes & Shara: 02/2006 -> https://archive.stsci.edu/prepds/cvcat/
       Ritter & Kolb: 12/2015 (7.24) -> https://wwwmpa.mpa-garching.mpg.de/RKcat/
    Número de objetos:
       Downes & Shara: 1361
       Ritter & Kolb: 1830
'''   
        
import pandas as pd
import numpy as np 
import csv
import operator


class Objetos(object):
     def __init__(self, nome, coord1, coord2, absol):
        self.nome = nome
        self.coord1 = coord1
        self.coord2 = coord2
        self.absol = absol
        
def setNome(nome):
    self.nome = nome

def setCoord1(coord1):
    self.coord1 = coord1

def setCoord2(coord2):
    self.coord2 = coord2

def setAbsol(absol):
    self.absol = absol


        
#vetores para armazenar nomes dos objetos
nomesRK = []
nomesDS = []

#vetores para armazenar RA dos objetos
raRK = []
raDS = []

#vetores para armazenar DEC dos objetos
decRK = []
decDS = []


#vetores auxiliares
auxRK = []
auxDS = []
difRK = []
difDS = []
equalsRK = []
equalsDS = []
noEqualsRK = []
noEqualsDS = []
resultados = []

#abrindo arquivos CSV's
leituraRK = open('RitKb.csv')
leituraDS = open('Downes.csv')


#variáveis readerDS e readerRK fazem a leitura dos arquivos CSV's
readerDS = csv.reader(leituraDS)
readerRK = csv.reader(leituraRK)

#deixando as tabelas ordenadas em ordem alfabética
#readerRK = sorted(readerRK)
#readerDS = sorted(readerDS)


#adicionando os dados em seus determinados vetores
for i in readerRK:
    i[0] = i[0].strip()
    #i[0] = i[0].replace(' ', '')
    nomesRK.append(i[0])

    i[1] = i[1].strip()
    i[1] = i[1].split()
    raRK.append(i[1])

    i[2] = i[2].strip()
    i[2] = i[2].split()
    decRK.append(i[2])

    auxRK.append(i[3:])
    

for k in readerDS:
    k[0] = k[0].strip()
    #k[0] = k[0].replace(' ', '')
    nomesDS.append(k[0])

    k[1] = k[1].strip()
    k[1] = k[1].replace(':', ' ')
    k[1] = k[1].split()
    raDS.append(k[1])

    k[2] = k[2].strip()
    k[2] = k[2].replace(':', ' ')
    k[2] = k[2].split()
    decDS.append(k[2])

    auxDS.append(k[3:])


#removendo headers e colunas sem informações
raRK.remove(raRK[0])
nomesRK.remove(nomesRK[0])
decRK.remove(decRK[0])

raDS.remove(raDS[1])
raDS.remove(raDS[0])


nomesDS.remove(nomesDS[1])
nomesDS.remove(nomesDS[0])


decDS.remove(decDS[1])
decDS.remove(decDS[0])

auxDS.remove(auxDS[1])
auxDS.remove(auxDS[0])

   
equalsCatalog = open('Lucas.csv')   

readerCat = csv.reader(equalsCatalog)


equalsRArk = []
equalsDECrk = []
nomesRK = []
nomesDS=  []

equalsRAds = []
equalsDECds = []

diferencasRA = []
diferencasDEC = []

for k in readerCat:
    nomesRK.append(k[0].strip())
    nomesDS.append(k[3].strip())
    equalsRArk.append(k[1].strip())
    equalsDECrk.append(k[2].strip())
    equalsRAds.append(k[4].strip())
    equalsDECds.append(k[5].strip())


for i in range(len(nomesRK)):
    tempRA1 = equalsRArk[i].split()
    tempRA2 = equalsRAds[i].split()

    temRK = equalsRArk[i]
    temDS = equalsRAds[i]

    nome = nomesRK[i]

    
    ra_arcsecRK = 15*(3600.0*int(tempRA1[0])+60.0*int(tempRA1[1])+float(tempRA1[2])) #transformando coordenada RA em segundos de arco (arcsec)
    ra_arcsecDS = 15*(3600.0*int(tempRA2[0])+60.0*int(tempRA2[1])+float(tempRA2[2])) #transformando coordenada RA em segundos de arco (arcsec)

    valorRA = abs(float(ra_arcsecRK) - float(ra_arcsecDS))

    obj = Objetos(nome, temRK, temDS, valorRA)
    diferencasRA.append(obj)
    
        
for i in range(len(nomesDS)):
    tempRA1 = equalsDECrk[i].split()
    tempRA2 = equalsDECds[i].split()

    tempRK = equalsDECrk[i]
    tempDS = equalsDECds[i]

    nome = nomesDS[i]

    
    dec_arcsecRK = 3600.0*int(tempRA1[0])+60.0*int(tempRA1[1])+float(tempRA1[2]) #transformando coordenada RA em segundos de arco (arcsec)
    dec_arcsecDS = 3600.0*int(tempRA2[0])+60.0*int(tempRA2[1])+float(tempRA2[2]) #transformando coordenada RA em segundos de arco (arcsec)

    valorDEC = abs(float(dec_arcsecRK) - float(dec_arcsecDS))

    obj = Objetos(nome, tempRK, tempDS, valorDEC)
    diferencasDEC.append(obj)



diferencasRA.sort(key = operator.attrgetter("absol"), reverse = False)
diferencasDEC.sort(key = operator.attrgetter("absol"), reverse = False)
r = 0
s = 0
print('ORDENAÇÃO POR ASCENÇÃO RETA')
for k in diferencasRA:
    r+=1
    print(str(k.nome)+', raRK: '+str(k.coord1)+', raDS: '+str(k.coord2)+'\ndiferença: '+str(k.absol)+'\n')
    

print('\n\n\n')

print('ORDENAÇÃO POR DECLINAÇÃO')
for k in diferencasDEC:
    s+=1
    print(str(k.nome)+', decRK: '+str(k.coord1)+', decDS: '+str(k.coord2)+'\ndiferença: '+str(k.absol)+'\n')
    
print(r)
print(s)
