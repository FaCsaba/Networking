# kódosztás többszörös hozzáférés
zajos csatornán is működőképes kommunikáció
kellően nagy redundancia, sélessáv fogadó oldalonbeazonosítható az interferálódott bitsorozat
S = lehet 0 v. 1 
adatbit m darab szimbólumbit tartozik
m = 2 hatványa

(+-1,+-1,+-1,....) = 1 adatbit (0|1)
S0 = (-1) * S1
S+T két különböző forrásból származó összeg = matematikai összeg
S*T = (1/m) * (belső szorzat)
két különböző forrásból származó szorzat = 0

S0 * S1 = -1
S0 * (-1) * S0 = (-1)(S0*S0) => S0 * S0 = 1
                                S1 * S1 = -1

Sx * Ty = 0

Viszga lehetőség
Működési feltétel
Ortogonális vector bitek


LAN technologiák
Ethernet
Lehetséges topologiák:
- Sín koaxiális kábellel
- Fa (repeater)
- Csillag (hub, switch)

Adatelem továbbítódik
- preamble 0xAA
- starting delimiter 0xAB
keret 
- header 
    - Cél fizikai cím
    - Küldő fizikai cím
    - length / type
- payload
    46 byte - 1500 byte
- tail 4 byte
    - redundancia kód (cyclic redundancy code)
kapcsolatmentes, nincs előrejelzés

46 <= MTU <= 1500
64 <= Maximum length <= 1518

Átviteli sebesség           10 Mbps (Manchester kódolás)
Résidő                      521 bitidő
Keret közötti idő IFG       9,6 ns
Átviteli kísérletek száma   16
zavaró bitek száma          32 bit idő

fizikai cím 48 bit

kerettovábbítás CSMA/CD (carrier sense multiple access / collision detection)

1. Várás keretre
2. Csatorna foglalt?
    - igen: ugrás -> 2.
    - nem: keretek közötti idő kivárása, majd a kerettovábbítás megkezdése
3. Van ütközés közben?
    - igen: Zavarójel küldés. További kisérletek számának növelése ugrás -> 4
    - nem: átvitel sikeres ugrás -> 1.
4. Elértük a max kísérletek számát (16)?
    - igen: Sikertelen továbbítás jelzése. ugrás -> 1
    - nem: Késleltetés kiszámítása és az idő kivárása. Ugrás -> 2

keretkésleltetés számolása
kábelkéseltetés: ~5 ns/1000 m
Résidő = 2 * (kábelkéleltetés + ismétlők késleltetése) + tartalék idő

Véletlenszerű várakozási időtartam
{0,1, 2^i}

keretfogadás CSMA/CD 
1. Van bejövő jel a közeg?
    - igen: csatorna foglaltságának jelzése. Bitszinkronizálás, keretkezdet azonosítás, keret beolvasás. ugrás -> 2
    - nem: ugrás az 1-re
2. Ellenőrző összeg (CRC) és kerethossz rendben van?
    - igen: ugrás -> 3
    - nem: keret eldobása. ugrás -> 1
3. Célcím = saját v. csoportcím?
    - igen: vett adat továbbítása. ugrás -> 1
    - nem: keret eldobása ugrás -> 1

Fast Ethernet:
100 Mb/s
4B/5B
házi 4B/5B kódolás 

