import networkx as nx
import matplotlib.pyplot as plt

# Inițializarea grafului
G = nx.Graph()

def afisare_graf():
    # Desenarea grafică a grafului
    pos = nx.spring_layout(G)
    nx.draw(G, pos, with_labels=True, node_size=500, node_color='lightblue')
    labels = nx.get_edge_attributes(G, 'valoare')
    nx.draw_networkx_edge_labels(G, pos, edge_labels=labels)
    plt.show()

def adauga_nod(cheie, valoare):
    # Adăugarea unui nod în graf
    G.add_node(cheie, valoare=valoare)

def adauga_muchie(nod1, nod2, cheie, valoare):
    # Adăugarea unei muchii între două noduri în graf
    G.add_edge(nod1, nod2, cheie=cheie, valoare=valoare)

def editare_nod(cheie, noua_valoare):
    # Editarea valorii unui nod
    G.nodes[cheie]['valoare'] = noua_valoare

def editare_muchie(nod1, nod2, noua_valoare):
    # Editarea valorii unei muchii
    G[nod1][nod2]['valoare'] = noua_valoare

def sterge_nod(cheie):
    # Ștergerea unui nod din graf
    G.remove_node(cheie)

def sterge_muchie(nod1, nod2):
    # Ștergerea unei muchii din graf
    G.remove_edge(nod1, nod2)

def muta_nod(cheie, pozitie):
    # Mutarea unui nod pe ecran
    G.nodes[cheie]['pozitie'] = pozitie

# Exemplu de utilizare
adauga_nod('Oras A', {'Populatie': 10000})
adauga_nod('Oras B', {'Populatie': 20000})
adauga_muchie('Oras A', 'Oras B', 'Drum 1', {'Lungime': 10})
afisare_graf()
editare_nod('Oras A', {'Populatie': 15000})
editare_muchie('Oras A', 'Oras B', {'Lungime': 15})
sterge_muchie('Oras A', 'Oras B')
sterge_nod('Oras A')
muta_nod('Oras B', (0.5, 0.5))
afisare_graf()
