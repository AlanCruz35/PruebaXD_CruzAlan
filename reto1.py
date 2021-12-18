#url json -> https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow

#1. descargar el json de la url 
import json, requests 

url = requests.get("https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow")
text = url.text

jsonData = json.loads(text)


#2. Obtener el número de respuestas contestadas y no contestadas

items = jsonData["items"]

contadorContestadas = 0
contadorNoContestadas = 0

for item in items:
    if item["is_answered"]:
   	    contadorContestadas = contadorContestadas + 1
    else:
        contadorNoContestadas = contadorNoContestadas + 1


#3. Obtener la respuesta con menor número de vistas

respuestas = jsonData["items"]

respuestaMenorNumeroVisitas = None

for respuesta in respuestas:
	if respuestaMenorNumeroVisitas is not None:
		previa = respuestaMenorNumeroVisitas["view_count"]
		actual = respuesta["view_count"]
		if actual < previa:
			respuestaMenorNumeroVisitas = respuesta
	else:
		respuestaMenorNumeroVisitas = respuesta



#4. Obtener la respuesta más vieja y más actual

respuestasFechas = jsonData["items"]

respuestaMasVieja = None
respuestaMasActual = None

for respuestaFecha in respuestasFechas:

	if respuestaMasVieja is not None:
		previa = respuestaMasVieja["creation_date"]
		actual = respuestaFecha["creation_date"]
		if actual < previa:
			respuestaMasVieja = respuestaFecha
	else:
		respuestaMasVieja = respuestaFecha


	if respuestaMasActual is not None:
		previaMasActual = respuestaMasActual["creation_date"]
		actualMasActual = respuestaFecha["creation_date"]
		if actualMasActual > previaMasActual :
			respuestaMasActual = respuestaFecha
	else:
		respuestaMasActual = respuestaFecha



#5. Obtener la respuesta del owner que tenga una mayor reputación

respuestasOwner = jsonData["items"]

respuestaMayorResputacion = None
reputacion = None


for respuestaOwner in respuestasOwner:

	if respuestaMayorResputacion is not None:
		
		previaOwner = respuestaMayorResputacion["owner"]
		previaReputacion = previaOwner["reputation"]

		actualOwner = respuestaOwner["owner"]
		actualReputacion = actualOwner["reputation"]

		if actualReputacion > previaReputacion:
			respuestaMayorResputacion = respuestaOwner
			reputacion = actualReputacion
	else:
		respuestaMayorResputacion = respuestaOwner
		owner = respuestaOwner["owner"]
		reputacion = owner["reputation"]




# Imprimir en consola del punto 2 al 5.
print('El número de respuestas contestadas es: ' , contadorContestadas, ' respuestas.')
print('El número de respuestas No contestadas es: ' , contadorNoContestadas, ' respuestas.')
print('La respuesta con menor número de vistitas es: ' , respuestaMenorNumeroVisitas["view_count"], ' visitas.')
print('La respuesta más vieja es: ', respuestaMasVieja["creation_date"])
print('La respuesta más actual es: ', respuestaMasActual["creation_date"])
print('La respuesta con mayor reputación es: ', reputacion)