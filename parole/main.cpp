#include <iostream>
#include <fstream>
#include <vector>
#include <limits.h>

using namespace std;

struct contaParole{
    string par;
    int count;
};

int main()
{
    string nomeFile = "canto1.txt";
    vector<string> linee;
    vector<string> parole;
    vector<string> appParole;
    vector<contaParole> conParVar;
    string parola = "";
    fstream f(nomeFile);
    string linea = "";
    int app;
    while(getline(f, linea)){
        linee.push_back(linea);
    }
    f.close();
    cout << "prova" << endl;
    for(int i=0; i<linee.size(); i++){
        if(parola != ""){
            parole.push_back(parola);
            parola = "";
        }
        for(int j=0; j<linee.at(i).size(); j++){
            if(linee.at(i).at(j) == ' ' || linee.at(i).at(j) == ',' || linee.at(i).at(j) == '.' || linee.at(i).at(j) == ';' || linee.at(i).at(j) == '\'' || linee.at(i).at(j) == '\"' || linee.at(i).at(j) == ':' || linee.at(i).at(j) == '?' || linee.at(i).at(j) == '!'){
                parole.push_back(parola);
                parola = "";
            }
            else{
                parola += linee.at(i).at(j);
            }
        }
    }
    cout << "PROVA" << endl;
    for(int i=0; i<parole.size(); i++){
        if(parole.at(i).size() < 4){
            parole.erase(parole.begin() + i);
            i--;
        }
    }
    cout << "PROVA3" << endl;
    cout << parole.size() << endl;
    for(int i=0; i<parole.size(); i++){
        appParole.push_back(parole.at(i));
    }
    cout << "PROVA4" << endl;
    for(int i=0; i<appParole.size(); i++){
        int conta = 0;
        for(int j=0; j<appParole.size(); j++){
            if(i != j){
                if(appParole.at(i) == appParole.at(j)){
                    appParole.erase(appParole.begin() + j);
                    j--;
                    conta++;
                }
            }
        }
        if(appParole.size()>i){
            conParVar.push_back(contaParole());
            conParVar.at(i).par = appParole.at(i);
            conParVar.at(i).count = conta;
        }
    }
    cout << "PROVA5" << endl;
    for(int i=0; i<10; i++){
        int max = INT_MIN;
        for(int j=0; j<conParVar.size(); j++){
            if(max<conParVar.at(j).count){
                max = conParVar.at(j).count;
                app = j;
            }
        }
        cout << (i+1) <<"°: " << conParVar.at(app).par << " Si ripete " << conParVar.at(app).count << " volte" << endl;
        conParVar.at(app).count = 0;
    }
    return 0;
    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
