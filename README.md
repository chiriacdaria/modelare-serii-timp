
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

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


We will consider a time series containing monthly quantities sold of a specific product by a store. The store predominantly sells installation components such as pipes, connectors, boilers, etc. There are products that sell especially in the fall, such as boilers, as customers prepare for the winter season, and others that sell mainly in the spring, such as irrigation systems.

Additionally, there are products that experience an increasing trend over time, such as thermal insulation materials. The data records time (in months) and the number of units sold for the relevant product over several years.

The dataset is provided in the form of a MATLAB file, containing two vectors of identical dimensions: time, where each element contains the index 'k' of the month, and y, which represents the quantity of the product 'y(k)' sold each month.

Before modeling, the dataset is divided into two parts – one for identification (the first 80% of samples) and one for validation (the last 20%).

The model created for the time series combines a first-order linear trend component, t0 + t1k, with a Fourier basis with a configurable number of terms denoted as m. This Fourier basis is used to anticipate periodicities in the data (annual, quarterly, etc.), and in our case, we consider a maximum annual periodicity with an implicit period of P = 12.

Each Fourier term generates two basic functions, cos and sin. The regressors of this model include components representing the linear trend (t0 and t1) and the Fourier basis functions (cos and sin) with various frequencies. Thus, the parameter vector is denoted as θ = [t0, t1, a1, b1, ..., am, bm], containing a total of 2 + 2m values.

For example, for m = 1 and the chosen period P = 12, the approximate form of the model is presented in the image below:
<img width="375" alt="Captură de ecran din 2024-02-20 la 13 29 17" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/5c56869e-b5c4-42e5-866a-b0e3f230aa7c">

Example m=1

For m = 2, we have:
<img width="545" alt="Captură de ecran din 2024-02-20 la 13 30 55" src="https://github.com/chiriacdaria/modelare-serii-timp/assets/99746700/59f0e1e6-396b-477c-855b-113524b4205b">

Example m=2

To obtain an optimal model, we need to find the vector of optimal parameters, θ*, for which the prediction ŷ best approximates the real values y on the identification dataset, minimizing the squared differences. Optimal parameters can be determined using linear regression, as detailed in the course "Part 2: Mathematical Bases," in the linear regression section.

The comprehensive report includes:

A contextual introduction to the problem.
A concise description of the approximator structure and parameter determination procedure.
Essential features of the individual solution, excluding trivial implementation details.
Obtained results, including Mean Squared Error (MSE) concerning m, presented in a graphic and tabular form.
Representative graphs for the optimal value of m.
In conclusion, we discuss the obtained results and highlight the importance of choosing optimal parameters for an efficient and accurate model in approximating the time series.
