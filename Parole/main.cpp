#include <iostream>
#include <fstream>
#include <unordered_map>
#include <algorithm>

using namespace std;

unordered_map<string, int> inserimentoNellaMappa(){
    unordered_map<string, int> appFrequenzaParole;
    string nomeFile = "canto1.txt";
    string parola = "";
    string linea = "";
    fstream f(nomeFile);
    while(getline(f, linea)){
        if(parola != ""){
            if(parola.size()>=4){
                if(appFrequenzaParole.find(parola) == appFrequenzaParole.end()) appFrequenzaParole.insert({parola, 1});
                else appFrequenzaParole.find(parola)->second++;
            }
            parola = "";
        }
        for(int i=0; i<linea.size(); i++){
            if(linea.at(i) == ' ' || linea.at(i) == ',' || linea.at(i) == '.' || linea.at(i) == ';' || linea.at(i) == '\'' || linea.at(i) == '\"' || linea.at(i) == ':' || linea.at(i) == '?' || linea.at(i) == '!'){
                if(parola.size()>=4){
                    if(appFrequenzaParole.find(parola) == appFrequenzaParole.end()) appFrequenzaParole.insert({parola, 1});
                    else appFrequenzaParole.find(parola)->second++;
                }
                parola = "";
            }
            else parola += linea.at(i);
        }
    }
    f.close();
    return appFrequenzaParole;
}


int main()
{
    unordered_map<string, int> frequenzaParole = inserimentoNellaMappa();
    string temp;
    for(int i=0; i<10; i++){
        int max = -1;
        for(auto x : frequenzaParole){
            if(max<x.second){
                max = x.second;
                temp = x.first;
            }
        }
        cout << (i+1) <<"°: " << temp << " si ripete " << max << " volte" << endl;
        frequenzaParole.erase(temp);
    }
    return 0;
}
