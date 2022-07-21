#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct Contact{
    string nome;
    string cognome;
    string numero;
};

class IFilter {
public:
    virtual bool filter(const Contact &contact) = 0;
};

class NameStartsWith : public IFilter {
    std::string m_name;
public:
    NameStartsWith(const std::string &name) : m_name(name) { };
    bool filter(const Contact &contact) override {
        if(m_name.at(0) == contact.nome.at(0)) return true;
        else return false;
    }
};

class Prefix : public IFilter {
    string c_prefisso;
public:
    Prefix(const string &prefisso) : c_prefisso(prefisso){};
    bool filter(const Contact &contact) override {
        int esci = 0;
        for(int i=0; i<c_prefisso.size(); i++){
            if(c_prefisso.at(i) == contact.numero.at(i)) esci++;
        }
        if(esci == c_prefisso.size()) return true;
        else return false;
    }
};

class NumContacts : public IFilter {
    int c_num;
public:
    NumContacts(const int &num) : c_num(num){};
    bool filter(const Contact &contact) override {
        if(c_num > 0){
            c_num--;
            return true;
        }
        else return false;
    }
};

class NumSurnameLetters : public IFilter {
    int c_num;
public:
    NumSurnameLetters(const int &num) : c_num(num){};
    bool filter(const Contact &contact) override {
        if(contact.cognome.size() >= c_num) return true;
        else return false;
    }
};

class Phonebook{
private:
    vector<Contact> contatti;
    friend ostream& operator<<(ostream& out, Contact *c){
        out << "Nome: " << c->nome << "\nCognome: " << c->cognome << "\nNumero di telefono: " << c->numero;
        return out;
    }
    friend ostream& operator<<(ostream& out, Phonebook pb){
        for(int i=0; i<pb.contatti.size(); i++){
            out << "\nNome: " << pb.contatti.at(i).nome << "\nCognome: " << pb.contatti.at(i).cognome << "\nNumero di telefono: " << pb.contatti.at(i).numero;
        }
        return out;
    }
public:
    void append(Contact c){
        contatti.push_back(c);
    }

    void setContacts(vector<Contact*> contacts){
        contatti.clear();
        for(int i=0; i<contacts.size(); i++){
            contatti.push_back(*contacts.at(i));
        }
    }

    Contact* find(string nome){
        for(int i=0; i<contatti.size(); i++){
            if(contatti.at(i).nome == nome){
                return &contatti.at(i);
            }
        }
        return nullptr;
    }

    vector<Contact*> filter(IFilter &f){
        vector<Contact*> res;
        for (auto &c : contatti) {
            if (f.filter(c)) {
                res.push_back(&c);
            }
        }
        return res;
    }
};

Contact creaContatto(){
    string nome, cognome, numero;
    cout << "Digita il nome: ";
    cin >> nome;
    cout << "Digita il cognome: ";
    cin >> cognome;
    do{
        cout << "Digita il numero (con prefisso): ";
        cin >> numero;
    }while(numero.at(0) != '+');
    Contact c;
    c.nome = nome;
    c.cognome = cognome;
    c.numero = numero;
    return c;
}

int main()
{
    Phonebook pb;
    int scelta = 0;
    do{
        cout << "\nScegli cosa fare:" << endl;
        cout << "0 - Esci" << endl;
        cout << "1 - Inserisci un contatto" << endl;
        cout << "2 - Trova il contatto dato il nome" << endl;
        cout << "3 - Stampa la rubrica" << endl;
        cout << "4 - Applica dei filtri" << endl;
        cin >> scelta;
        switch(scelta){
            case 0:
                break;
            case 1: {
                Contact c = creaContatto();
                pb.append(c);
                break;
            }
            case 2: {
                string nome;
                cout << "Digita il nome: ";
                cin >> nome;
                Contact *c = pb.find(nome);
                if(c == nullptr) cout << "Non esiste un contatto con il nome appena digitato" << endl;
                else cout << "\nNome: " << c->nome << "\nCognome: " << c->cognome << "\nNumero: " << c->numero << endl;
                break;
            }
            case 3: {
                cout << pb;
                break;
            }
            case 4: {
                int sceltaF;
                Phonebook filtPb = pb;
                do{
                    cout << "\nGestisci i filtri:" << endl;
                    cout << "0 - Esci" << endl;
                    cout << "1 - Nome inizia con" << endl;
                    cout << "2 - Prefisso" << endl;
                    cout << "3 - Numero di contatti da visualizzare" << endl;
                    cout << "4 - Numero lettere del cognome" << endl;
                    cout << "5 - Resetta i filtri" << endl;
                    cin >> sceltaF;
                    vector<Contact*> res;
                    switch(sceltaF){
                        case 0:
                            break;
                        case 1: {
                            string app;
                            cout << "Digita la/e lettera/e: ";
                            cin >> app;
                            NameStartsWith *temp = new NameStartsWith(app);
                            res = filtPb.filter(*temp);
                            filtPb.setContacts(res);
                            cout << filtPb;
                            break;
                        }
                        case 2: {
                            string app;
                            cout << "Digita il prefisso: ";
                            cin >> app;
                            Prefix *temp = new Prefix(app);
                            res = filtPb.filter(*temp);
                            filtPb.setContacts(res);
                            cout << filtPb;
                            break;
                        }
                        case 3: {
                            int app;
                            cout << "Digita il numero di contatti: ";
                            cin >> app;
                            NumContacts *temp = new NumContacts(app);
                            res = filtPb.filter(*temp);
                            filtPb.setContacts(res);
                            cout << filtPb;
                            break;
                        }
                        case 4: {
                            int app;
                            cout << "Digita il numero di lettere dei cognomi: ";
                            cin >> app;
                            NumSurnameLetters *temp = new NumSurnameLetters(app);
                            res = filtPb.filter(*temp);
                            filtPb.setContacts(res);
                            cout << filtPb;
                            break;
                        }
                        case 5: {
                            filtPb = pb;
                            cout << filtPb;
                            break;
                        }
                    }
                }while(sceltaF != 0);
                break;
            }
        }
    }while(scelta != 0);
    return 0;
}
