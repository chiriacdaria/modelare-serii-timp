

# Identificarea Sistemelor - MODELAREA SERIILOR DE TIMP (Proiect 1 :beverage_box: )


## :anchor: Cuprins

I. [Descrierea proiectului](#i-descrierea-proiectului)  
II. [Descrierea structurii aproximatorului și a procedurii de găsire a parametrilor](#ii-descrierea-structurii-aproximatorului-și-a-procedurii-de-găsire-a-parametrilor)  
III. [Implementarea - Caracteristicile structurii](#iii-implementarea---caracteristicile-structurii)  
IV. [Grafice reprezentative](#iv-grafice-reprezentative)  
V. [Concluzie](#v-concluzie)  

## :bellhop_bell: I. Descrierea proiectului

Proiectul constă în modelarea seriilor de timp utilizând funcții de bază Fourier. Problema dată înregistrează vânzările anumitor componente de instalații în funcție de nevoia folosirii lor de-a lungul unei serii de timp care se întinde pe parcursul mai multor ani și vor fi stocate în funcție de indecșii lunilor.


Vom considera o serie de timp conținând cantitățile lunare vândute dintr-un anumit produs de către un magazin. Magazinul vinde mai ales componente de instalații, cum ar fi țevi, conectori, boilere, etc. Există așadar produse care se vând mai ales toamna, cum ar fi boilerele, fiindcă clienții se pregătesc pentru sezonul rece, și alte produse care se vând mai ales primăvara, cum ar fi sistemele de irigație.

Vom examina o serie de timp care reflectă cantitățile lunare vândute ale unui anumit produs de către un magazin, cu focus pe componente de instalații precum țevi, conectori și boilere. Există produse care cunosc perioade de vânzări mai mari toamna, cum ar fi boilerele, în anticiparea sezonului rece, și altele cu vânzări sporite în primăvară, cum ar fi sistemele de irigație.

În plus, există produse cu o creștere constantă în timp, precum materialele de izolare termică. Datele cuprind informații despre timp (în luni) și cantitatea de produs vândută în fiecare lună, întinsă pe parcursul mai multor ani.

Setul de date este furnizat sub forma unui fișier MATLAB, conținând doi vectori de dimensiuni identice: time, unde fiecare element indică luna corespunzătoare, și y, care reflectă cantitatea de produs (y(k)) vândută în acea lună.

Înainte de a modela datele, setul este împărțit în două părți distincte: una pentru identificare (primele 80% dintre eșantioane) și una pentru validare (ultimele 20%).

Modelul creat pentru seria de timp combină o componentă de tendință liniară de ordinul întâi, t0 + t1k, cu o bază Fourier ce include un număr variabil de termeni, notat cu m. Această bază Fourier este utilizată pentru a anticipa eventuale periodicități în date (anuale, trimestriale etc.), iar în cazul nostru, considerăm o periodicitate maximă anuală, cu o perioadă implicită P = 12.
<img width="375" alt="Captură de ecran din 2024-02-20 la 13 29 17" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/5c56869e-b5c4-42e5-866a-b0e3f230aa7c">

Fiecare termen Fourier generează două funcții de bază, cos și sin. Regresorii acestui model includ componentele pentru tendința liniară (t0 și t1) și funcțiile de bază Fourier (cos și sin) cu diverse frecvențe. Astfel, vectorul de parametri este notat cu θ = [t0, t1, a1, b1, ..., am, bm] și conține în total 2 + 2m valori.

De exemplu, pentru m = 1 și perioada aleasă P = 12, forma aproximatoare a modelului este prezentată în imaginea următoare:

<img width="403" alt="Captură de ecran din 2024-02-20 la 13 30 37" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/aacadb92-2932-4d43-85a2-6eddd1e8acb7">

Pentru m=2 avem

<img width="545" alt="Captură de ecran din 2024-02-20 la 13 30 55" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/59f0e1e6-396b-477c-855b-113524b4205b">

Pentru a determina un model optim, trebuie să găsim vectorul de parametri optimi, θ*, pentru care predicția ŷ se apropie cel mai mult de valorile reale y pe setul de date de identificare, în sensul minimizării pătratelor diferențelor. Parametrii optimi pot fi deduși prin regresie liniară, detaliată în cursul "Partea 2: Baze matematice," în secțiunea de regresie liniară.

Raportul comprehensiv cuprinde:

Introducere contextualizată a problemei.
Descrierea succintă a structurii aproximatoare și a procedurii de determinare a parametrilor.
Caracteristicile esențiale ale soluției individuale, excluzând detalii triviale de implementare.
Rezultatele obținute, inclusiv eroarea medie pătratică (MSE) în funcție de m, prezentată sub formă de grafic și tabel.
Grafice reprezentative pentru valoarea optimă a lui m.
În concluzie, discutăm rezultatele obținute și evidențiem importanța alegerii optime a parametrilor pentru un model eficient și precis în aproximarea seriei de timp.


##  :bellhop_bell: II. Descrierea structurii aproximatorului și a procedurii de găsire a parametrilor
### II.I. Procedura de găsire a parametrilor

Pentru identificare și validare, am împărțit setul de date furnizat în Matlab în două părți. Prima parte reprezintă 80% din setul de date, aproximativ 88 de puncte, în timp ce a doua parte reprezintă restul de 20% pentru datele de validare (21 puncte).

Am realizat un grafic pentru a vizualiza datele furnizate și am creat modele ale seriei de timp. 
Am creat modele ale seriei de timp de forma:

<img width="583" alt="Captură de ecran din 2024-02-20 la 14 14 40" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/73de8bcf-1c92-4fde-bdea-4bd28de131fc">

Formula modelelor are două componente: o componentă de tendință liniară de ordinul I (t0 + t1k) și o bază Fourier cu un număr configurabil de termeni m.

Folosind variabilele ajutătoare nr1 și nr2 pentru stocarea funcțiilor cosinus și sinus, am format matricea Φ, care conține regresorii. Procedura matematică pentru regresia liniară este θ = Φ\Y, unde Y este setul de date de ieșire (88 de date de identificare în cazul nostru), iar Φ este matricea calculată anterior.

Am realizat grafice pentru identificare și validare pentru a urmări corectitudinea calculelor. Am calculat eroarea medie pătratică (MSE), iar formula pentru asigurarea corectitudinii soluției este utilizarea formulei MSE.

<img width="202" alt="Captură de ecran din 2024-02-20 la 14 16 11" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/03d128d1-7059-4878-88ad-f3fc4855ecdd">


### II.II. Descrierea structurii aproximatorului

După determinarea regresiei liniare, am continuat cu funcționalitatea aproximatorului polinomial. Structura aproximatorului depinde de gradul m, iar regresorii includ elementele tendinței liniare (1, k) și funcțiile cosinus și sinus ale bazei Fourier. Am ales m=8 pentru a obține eroare minimă (MSE).

## :bellhop_bell: III. Implementarea - Caracteristicile structurii

În primul pas, am împărțit datele în seturi de identificare și validare. Apoi, am generat matricea Q pentru ambele seturi. Am abordat problema generării matricei Φ, generând fiecare linie folosind regresia liniară și adăugând apoi aceste linii la matrice.

După obținerea matricei Φ, am calculat valorile pentru θ folosind formula θ = Φ \(y_id)', atât pentru validare cât și pentru identificare. După obținerea Φ și θ, am calculat aproximarea funcției y prin înmulțirea matricei cu vectorul de parametri. Am verificat corectitudinea soluțiilor pentru identificare și validare prin calcularea MSE.

## :bellhop_bell: IV. Grafice reprezentative

### IV.I Datele furnizate (datele inainte de a fi impartite)

<img width="371" alt="Captură de ecran din 2024-02-20 la 14 18 14" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/cb0076f7-636f-4b83-97f1-41e3d8ece3e0">

### IV.II Datele de identificare si validare cu y aproximat pentru fiecare caz

<img width="268" alt="Captură de ecran din 2024-02-20 la 14 18 51" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/336e7e57-9960-4db2-9fcf-1ca28da8e2cf">

### IV.VI Grafice erori →MSE

<img width="264" alt="Captură de ecran din 2024-02-20 la 14 19 16" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/4497bd07-9f59-409a-93f9-11dea6d3728a">

### IV.V Grafic cu datele furnizate si y aproximat pentru intreg setul de date

<img width="280" alt="Captură de ecran din 2024-02-20 la 14 19 36" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/e852f93f-b4dd-4a0c-85f5-840888ce7d69">

## :bellhop_bell: V. Concluzie

În concluzie, am abordat problema pe etape și am încercat să o structurăm cât de clar a fost posibil, astfel am ajuns la rezultatele dorite.
De-a lungul problemei, am împărțit datele pentru validare cât și pentru identificare, apoi, am generat matricile pentru fiecare din situații, folosindu-ne de algoritmul regresiei liniare pentru a genera fiecare linie, iar mai apoi le-am adaugat în matrice. 
Am calculat aproximarea funcției, am făcut verificarea pentru ambele soluții, atât pentru validare cât și pentr identificare prin calcularea erorii medii pătratice și am reprezentat grafic datele.
În figura 1, am reprezentat datele furnizate, înainte ca ele să fie împărțite. 
În figurile 2 și 3, am reprezentat datele pentru identificare, validare cu y-ul aproximat.
În figura 4, vedem graficele erorilor medii pătratice și putem observa că avem cea mai bună soluție pentru identificare pentru m=3, iar pentru m=2 obținem cea mai bună soluție pentru
validare. 
Figura 5, ne arată fluctuațiile datelor pentru întreg setul de date, între datele furnizate și y aproximat.
