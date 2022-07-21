#include <iostream>
#include <vector>
#include <limits.h>
#include <algorithm>

using namespace std;

int main()
{
    string scelta;
    vector<int> numeri;
    int app;
    do{
        cout << "Vuoi inserire un numero? (y/n)" << endl;
        cin >> scelta;
        if(scelta == "y"){
            cout << "Inserisci il numero:" << endl;
            cin >> app;
            numeri.push_back(app);
            scelta = "a";
        }
        if(scelta == "n"){
            sort(numeri.begin(), numeri.end());
            if(numeri.size() % 2 != 0){
                cout << "La mediana e': " << numeri.at(numeri.size()/2) << endl;
            }
            else{
                float med;
                med = (static_cast<float>(numeri.at((numeri.size()/2) - 1) + numeri.at(numeri.size()/2))/2);
                cout << "La mediana e': " << med << endl;
            }
        }
    }while(scelta != "y" && scelta != "n");
    return 0;
}
