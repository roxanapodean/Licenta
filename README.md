# SECURIZAREA MAGISTRALELOR SAE J1939 PRINTR-UN SISTEM DE DETECȚIE A INTRUZIUNILOR BAZAT PE REȚELE NEURONALE

## Scopul Proiectului

Această lucrare de licență are ca scop implementarea unui sistem de detecție a intruziunilor bazat pe rețele neuronale pentru securizarea magistralelor SAE J1939. Aceste magistrale facilitează comunicarea între unitățile electronice de control (ECU), utilizate în vehiculele comerciale. Securizarea lor este importantă pentru a detecta atacurile cibernetice care pot pune în pericol siguranța soferului, a vehiculului și a tuturor participanților la trafic.

## Repository-ul Proiectului

Adresa repository-ului este https://github.com/roxanapodean/Licenta.git.

## Structura Repository-ului

1. `date` : Conține fișierul "trace.blf" ce reprezintă datele colectate de pe vehiculul comercial;
2. `canoe` : "Attacks.can" - modelul adversarului și "Attacks.xvp" - interfața grafică pentru inserarea atacurilor;
3. `script` : "Script.cs" - fișiser C# pentru parsarea datelor;
4. `matlab` : "ImportData.m", "NeuralNetwork.m", "myNeuralNetworkFunction.m" - fișiere pentru rețeaua neuronală;
5. `codeblocks` : "main.c", "main.h", "myNeuralNetworkFunction.c", "myNeuralNetworkFunction.h" - fișierele necesare pentru portarea rețelei neuronale.

## Pașii de Instalare și Compilare a Proiectului

 1. Medii de dezvoltare necesare:
	- CANoe (+licentă);
	- Visual Studio Code;
	- MATLAB (+ MATLAB Coder);
	- Code::Blocks;

 2. Rulare:
   	### CANoe
	- Se adaugă fișierele Attacks.can, Attacks.xvp în CANoe;
 	- Se adaugă block de replay pentru fișierul trace.blf (click dreapta pe magistrala CAN -> Insert Replay Block CAN, se selectează fișierul trace.blf)
  	- Se compilează Attacks.can și se pornește simulația. Cu ajutorul interfeței grafice (Home -> Panel -> Attacks), se inserează atacurile. Se obține un fișier "*.asc" care conține atât mesajele legitime, cât și mesajele de atac;
     ### Visual Studio Code
	- În Visual Studio Code se rulează "Script.cs" pentru a parsa fișierul "*.asc", rezultat în urma inserării atacurilor;
 	- Comenzi Terminal: dotnet build, dotnet run;
	### MATLAB 
	- Fișierul obținut în urma parsării datelor, se importă în MATLAB, rulând fișierul "ImportData.m";
 	- Se antrenează rețeaua neuronală prin rularea fișierului "NeuralNetwork.m";
	- Pentru a deschide MATLAB Coder, se introduce "coder" în linia de comandă; în secțiunea Generate code for function, se selectează funcția "myNeuralNetworkFunction.m" -> Next -> se selectează scriptul NeuralNetwork.m, care apelează funcția myNeuralNetworkFunction.m. În final, se obțin fișierele C generate pe baza rețelei neuronale;
	### Code::Blocks
	- În Code::Blocks se importă fișierele "main.c", "main.h", "myNeuralNetwork.c", "myNeuralNetwork.h" și se rulează "main.c" pentru a testa funcționarea rețelei neuronale.
