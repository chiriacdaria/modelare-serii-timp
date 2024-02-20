
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





