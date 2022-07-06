#include <iostream>

using namespace std;

int main()
{
    string scelta;
    int somma = 0;
    int num;
    while (scelta != "n") {
        do{
            cout << "Vuoi inserire un numero? (y/n)" << endl;
            cin >> scelta;
            if(scelta == "y"){
                cout << "Inserisci il numero" << endl;
                cin >> num;
                somma += num;
            }
        }while(scelta == "y" && scelta != "n");
    }
    cout << "La somma totale e': " << somma << endl;
    return 0;
}
