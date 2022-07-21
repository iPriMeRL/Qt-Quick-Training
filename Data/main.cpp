#include <iostream>

using namespace std;

class Date{
public:
    Date(){
        day = 1;
        month = 1;
        year = 1970;
    }
    Date(int day, int month, int year){
        this->day = day;
        this->month = month;
        this->year = year;
    }
    Date(string data){
        parseDate(data);
    }
    int getDay(){
        return day;
    }
    int getMonth(){
        return month;
    }
    int getYear(){
        return year;
    }
    void addDays(int num){
        day += num;
        int esci = 0;
        while(esci == 0){
            if(month == 2){
                if(year%100 == 0){
                    if(year%400 == 0){
                        if(day > 29){
                            day -= 29;
                            month++;
                        }
                        else esci++;
                    }
                    else{
                        if(day > 28){
                            day -= 28;
                            month++;
                        }
                        else esci++;
                    }
                }
                else if(year%4 == 0){
                    if(day > 29){
                        day -= 29;
                        month++;
                    }
                    else esci++;
                }
                else{
                    if(day > 28){
                        day -= 28;
                        month++;
                    }
                    else esci++;
                }
            }
            else if(month == 4 || month == 6 || month == 9 || month == 11){
                if(day > 30){
                    day -= 30;
                    month++;
                }
                else esci++;
            }
            else{
                if(day > 31){
                    day -= 31;
                    month ++;
                    if(month == 13){
                        month = 1;
                        year++;
                    }
                }
                else esci++;
            }
        }
    }
    void addMonths(int num){
        for(int i=0; i<num; i++){
            if(month == 2){
                if(year%4 == 0 && year%100 == 0 && year%400 == 0) addDays(29);
                else addDays(28);
            }
            else if(month == 4 || month == 6 || month == 9 || month == 11) addDays(30);
            else addDays(31);
        }
    }
    void addYears(int num){
        addMonths(num*12);
    }
    void parseDate(string s){
        int fineSub = s.find('-');
        day = stoi(s.substr(0, fineSub));
        int inizioSub = fineSub+1;
        s.at(fineSub) = '/';
        fineSub = s.find('-');
        month = stoi(s.substr(inizioSub, fineSub-inizioSub));
        inizioSub = fineSub+1;
        s.at(fineSub) = '/';
        fineSub = s.length();
        year = stoi(s.substr(inizioSub, fineSub-inizioSub));
    }

    string toString(){
        return to_string(day)+'-'+to_string(month)+'-'+to_string(year);
    }
private:
    int day, month, year;
    friend ostream& operator<<(ostream& out, Date d){
        out << d.day << "-" << d.month << "-" << d.year;
        return out;
    }
    friend bool operator==(const Date& one, const Date& other){
        return one.day == other.day && one.month == other.month && one.year == other.year;
    }
};

int main()
{
    string data;
    int nGio, nMes, nAnn;
    cout << "Inserisci la data:" << endl;
    cin >> data;
    Date d1 = *new Date(data);
    cout << "Inserisci il numero di giorni da aggiugere:" << endl;
    cin >> nGio;
    d1.addDays(nGio);
    cout << "Data modificata: " << d1 << endl;
    cout << "Inserisci il numero di mesi da aggiugere:" << endl;
    cin >> nMes;
    d1.addMonths(nMes);
    cout << "Data modificata: " << d1 << endl;
    cout << "Inserisci il numero di anni da aggiugere:" << endl;
    cin >> nAnn;
    d1.addYears(nAnn);
    cout << "Data modificata: " << d1 << endl;
    cout << "Inserisci un'altra data:" << endl;
    cin >> data;
    Date d2 = *new Date(data);
    if(d1 == d2) cout << "Le date sono uguali" << endl;
    else cout << "Le date sono diverse" << endl;
    cout << d1 << endl;
    cout << d2 << endl;
    return 0;
}
