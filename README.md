# Barosello_20170603
Esercizio Barosello terminato in data 20170603
NB:
Per gli ste 1 e 2, basta lanciare lo script.
Per gli altri step, prima imortare lo script:
. .\<path>\barosello.ps1
e poi eseguirlo con i parametri. E' possibile specificare il range (da 0 a x) e se stampare o meno il risultato:
Barosello -Range 100 -PrintRes

Negli step 4 e 5, i colori e la stampa su console/twitter e' hardcoded.

Nello step 5, la chiamata alle API di Twitter e' solo simulata in quanto bisognerebbe procurarsi i dati di autenticazione e si puo' fare o con chiamata naitva WebRequest o tramite un modulo non incluso disponibile qui https://gallery.technet.microsoft.com/scriptcenter/InvokeTwitterAPIs-84cf88a3 che pero' richiede PowerShell 3.0.
