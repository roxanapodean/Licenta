# SECURIZAREA MAGISTRALELOR SAE J1939 PRINTR-UN SISTEM DE DETECȚIE A INTRUZIUNILOR BAZAT PE REȚELE NEURONALE

## Scopul Proiectului

Această lucrare de licență are ca scop implementarea unui sistem de detecție a intruziunilor bazat pe rețele neuronale pentru securizarea magistralelor SAE J1939. Aceste magistrale facilitează comunicarea între unitățile electronice de control (ECU), utilizate în vehiculele comerciale. Securizarea lor este importantă pentru a detecta atacurile cibernetice care pot pune în pericol siguranța soferului, a vehiculului și a tuturor participanților la trafic.

## Repository-ul Proiectului

Adresa repository-ului este https://github.com/roxanapodean/Licenta.git.

## Structura Repository-ului

1. `date` : Conține fișierul "trace.blf" ce reprezintă datele colectate de pe vehiculul comercial;
2. `canoe` : "Attacks.can" - modelul adverasului și "Attacks.xvp" - interfața grafică pentru inserarea atacurilor;
3. `script` : "Script.cs" - fișiser C# pentru parsarea datelor;
4. `matlab` : "ImportData.m", "NeuralNetwork.m", "myNeuralNetworkFunction.c" - rețeaua neuronală;
5. `codeblocks` : "main.c", "main.h", "myNeuralNetworkFunction.c", "myNeuralNetworkFunction.h" - fișierele necesare pentru portarea rețelei neuronale.

## Pașii de Instalare și Compilare a Proiectului

1. Medii de dezvoltare necesare:
	- CANoe;
	- Visual Studio Code;
	- MATLAB (și MATLAB Coder);
	- Code::Blocks;

2. Rulare:
	- Se adaugă fișierele trace.blf, Attacks.can, Attacks.xvp în CANoe. Se adaugă block de replay pentru fișierul trace.blf, se compilează Attacks.can și se pornește simulația. Cu ajutorul interfeței grafice, se inserează atacurile. Se obține un fișier "*.asc" care conține atât mesajele legitime, cât și mesajele de atac;
	- În Visual Studio Code se rulează "Script.cs" pentru a parsa fișierul "*.asc", rezultat în urma inserării atacurilor;
	- Fișierul obținut în urma parsării datelor, se importă în MATLAB, rulând fișierul "ImportData.m"; se antrenează rețeaua neuronală prin rularea fișierului "NeuralNetwork.m";
	- Se utilizează MATLAB Coder și funcția "myNeuralNetworkFunction.m" pentru generarea codului C pe baza rețelei neuronale;
	- În Code::Blocks se rulează fișierele "main.c", "main.h", "myNeuralNetwork.c", "myNeuralNetwork.h" pentru a testa funcționarea rețelei neuronale.
