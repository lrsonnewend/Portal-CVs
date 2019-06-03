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
raDS.remove(raDS[0])
raDS.remove(raDS[1])
nomesRK.remove(nomesRK[0])
nomesDS.remove(nomesDS[0])
nomesDS.remove(nomesDS[1])
decRK.remove(decRK[0])
decDS.remove(decDS[0])
decDS.remove(decDS[1])



#bloco para capturar objetos com o mesmo nome e objetos com coordenadas dentro do critério
rN = 0
rC = 0
for j in range(len(nomesRK)):
    for i in range(len(nomesDS)):
        if(nomesDS[i] == nomesRK[j]):
            #caso os objetos tenham o mesmo nome:
            rN+=1 #contador de objetos
            tempoRArk = ' '.join(raRK[j])#recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
            tempoDECrk = ' '.join(decRK[j])#recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
            tempoAuxRK = ',  '.join(auxRK[j])#junta as informações adicionais do objeto separando-as em vírgula (,)
            
            tempoRAds = ' '.join(raDS[i])#recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
            tempoDECds = ' '.join(decDS[i])#recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
            tempoAuxDS = ',  '.join(auxDS[i])#junta as informações adicionais do objeto separando-as em vírgula (,)
                                        
            '''print('nomeRK: ' +str(nomesRK[j])+'  nomeDS: '+str(nomesDS[i]))
            print('RArk: '+str(raRK[j])+'   DECrk: '+str(decRK[j]))
            print('RAds: '+str(raDS[i])+'  DECds: '+str(decDS[i]))
                                        
            print('\n')'''                                    

            #print(f'Objeto RK- pos {j} Objeto DS - pos {i}')

            #armazena em uma variável os dados necessários para montar o arquivo csv (catálogo)
            results = (str(nomesRK[j])+',  '+str(tempoRArk)+',  '+str(tempoDECrk)+',  '+str(tempoAuxRK)
                    +',  '+str(nomesDS[i])+',  '+str(tempoRAds)+',  '+str(tempoDECds))
            
            '''results = (str(nomesRK[j])+',  '+str(tempoRArk)+',  '+str(tempoDECrk)+',  '+str(tempoAuxRK)
                    +',  '+str(nomesDS[i])+',  '+str(tempoRAds)+',  '+str(tempoDECds)+',  '+str(tempoAuxDS)+'  ,  http://simbad.u-strasbg.fr/simbad/sim-id?Ident='+str(nomesRK[j])
                    +',  http://simbad.u-strasbg.fr/simbad/sim-coo?Coord='+str(tempoRArk)+'++'+str(tempoDECrk)
                    +'&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=')'''
                                                                            
            #print(results)

            resultados.append(results)#adicionando variável ao vetor resultados
            
            break #passa para o próximo objeto
        

        elif nomesDS[i] != nomesRK[j]:
            #caso os objetos tenham nomes diferentes:
            
            if len(raDS[i]) == 3:
                tempDS = raDS[i] #variável temporária recebe RA do objeto
                tempRK = raRK[j] #variável temporária recebe RA do objeto

                ra_arcsecRK = 15*((3600*float(tempRK[0]))+(60*float(tempRK[1]))+(float(tempRK[2]))) #transformando coordenada RA em segundos de arco (arcsec)
                ra_arcsecDS = 15*((3600*float(tempDS[0]))+(60*float(tempDS[1]))+(float(tempDS[2]))) #transformando coordenada RA em segundos de arco (arcsec)

                dec_arcsecRK = (3600*float(tempRK[0]))+(60*float(tempRK[1]))+(float(tempRK[2])) #transformando coordenada DEC em segundos de arco (arcsec)
                dec_arcsecDS = (3600*float(tempDS[0]))+(60*float(tempDS[1]))+(float(tempDS[2])) #transformando coordenada DEC em segundos de arco (arcsec)
                
                if abs(ra_arcsecRK - ra_arcsecDS) < 5.0 and abs(dec_arcsecRK - dec_arcsecDS) < 5.0: #caso a diferença seja menor do que 5 segundos de arco:
                    
                    rC+=1 #contador de objetos
                    tempoRArk = ' '.join(raRK[j]) #recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
                    tempoDECrk = ' '.join(decRK[j]) #recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
                    tempoAuxRK = ',  '.join(auxRK[j]) #junta as informações adicionais do objeto separando-as em vírgula (,)
                    
                    tempoRAds = ' '.join(raDS[i]) #recebe o valor do RA formatado em espaço e sem ponto e vírgula (;)
                    tempoDECds = ' '.join(decDS[i]) #recebe o valor do DEC formatado em espaço e sem ponto e vírgula (;)
                    tempoAuxDS = ',  '.join(auxDS[i]) #junta as informações adicionais do objeto separando-as em vírgula (,)
                                        
                    '''print('nomeRK: ' +str(nomesRK[j])+'  nomeDS: '+str(nomesDS[i]))
                    print('RArk: '+str(raRK[j])+'   DECrk: '+str(decRK[j]))
                    print('RAds: '+str(raDS[i])+'  DECds: '+str(decDS[i]))
                                        
                    print('\n')'''                                    

                    #print(f'Objeto RK- pos {j} Objeto DS - pos {i}')
                    
                    #armazena em uma variável os dados necessários para montar o arquivo csv (catálogo)
                    results = (str(nomesRK[j])+',  '+str(tempoRArk)+',  '+str(tempoDECrk)+',  '+str(tempoAuxRK)
                        +',  '+str(nomesDS[i])+',  '+str(tempoRAds)+',  '+str(tempoDECds))
            
                    '''results = (str(nomesRK[j])+',  '+str(tempoRArk)+',  '+str(tempoDECrk)+',  '+str(tempoAuxRK)
                    +',  '+str(nomesDS[i])+',  '+str(tempoRAds)+',  '+str(tempoDECds)+',  '+str(tempoAuxDS)+'  ,  http://simbad.u-strasbg.fr/simbad/sim-id?Ident='+str(nomesRK[j])
                    +',  http://simbad.u-strasbg.fr/simbad/sim-coo?Coord='+str(tempoRArk)+'++'+str(tempoDECrk)
                    +'&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=')'''
                                                                            
                    #print(results)
                    
                    resultados.append(results)  #adicionando variável ao vetor resultados
                    break #passa para o próximo objeto

                    

                   
print(f'\nquantidade de objetos com o mesmo nome: {rN}')
print(f'\nquantidade de objetos dentro do critério de coordenada: {rC}')
print(f'\nTotal: {rN+rC}')




    
'''equalsCatalog = open('Lucas.csv')   

readerCat = csv.reader(equalsCatalog)

raRK.remove(raRK[0])
raDS.remove(raDS[0])
nomesRK.remove(nomesRK[0])
nomesDS.remove(nomesDS[0])
decRK.remove(decRK[0])
decDS.remove(decDS[0])

for k in readerCat:
    equalsRK.append(k[1].strip())
    equalsDS.append(k[11].strip())
    
    


rk = 0
ds = 0


    
for i in range(len(raRK)):
    raRK[i] = ' '.join(raRK[i])
    if not raRK[i] in equalsRK:
        decRK[i] = ' '.join(decRK[i])
        auxRK[i] = ',  '.join(auxRK[i])

        results = (str(nomesRK[i])+',  '+str(raRK[i])+',  '+str(decRK[i])+',  '+str(auxRK[i])+' , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , ,'+
                   ',  http://simbad.u-strasbg.fr/simbad/sim-id?Ident='+str(nomesRK[i])+',  http://simbad.u-strasbg.fr/simbad/sim-coo?Coord='+str(raRK[i])+'++'+str(decRK[i])
                       +'&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=')

        noEqualsRK.append(results)
        rk+=1


cont = 0       
for j in range(len(raDS)):
    raDS[j] = ' '.join(raDS[j])
    cont +=1
    if cont > 1:
        if not raDS[j] in equalsDS:
            decDS[j]= ' '.join(decDS[j])
            auxDS[j] = ',  '.join(auxDS[j])

            results = (' , , , , , , , , , , '+str(nomesDS[j])+',  '+str(raDS[j])+',  '+str(decDS[j])+',  '+str(auxDS[j])+',  http://simbad.u-strasbg.fr/simbad/sim-id?Ident='+str(nomesDS[j])+',  http://simbad.u-strasbg.fr/simbad/sim-coo?Coord='+str(raDS[j])+'++'+str(decDS[j])
                       +'&CooFrame=FK5&CooEpoch=2000&CooEqui=2000&CooDefinedFrames=none&Radius=5&Radius.unit=arcsec&submit=submit+query&CoordList=')

            noEqualsDS.append(results)
            ds+=1


for k in resultados:
    print(k)


for i in noEqualsRK:
    print(i)

for j in noEqualsDS:
    print(j)




print(f'\nobjetos incomuns de Ritter & Kolb: {rk}')

print(f'\nobjetos incomuns de Downes & Shara: {ds}')'''
