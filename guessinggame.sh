#!/bin/bash

# Fonction qui calcule le nombre de fichiers dans le répertoire courant
count_files() {
    ls -1 | wc -l
}

# Fonction principale du jeu
play_game() {

    correct_number=$(count_files)
    guess=-1

    echo "Bienvenue dans le jeu Guessing Game !"
    echo "Devinez combien de fichiers se trouvent dans le répertoire actuel."

    # Boucle jusqu'à la bonne réponse
    while [[ $guess -ne $correct_number ]]
    do
        echo -n "Entrez votre estimation : "
        read guess

        # Vérification si l'entrée est un nombre
        if ! [[ "$guess" =~ ^[0-9]+$ ]]
        then
            echo "Veuillez entrer un nombre valide."
        elif [[ $guess -lt $correct_number ]]
        then
            echo "Votre estimation est trop basse. Essayez encore."
        elif [[ $guess -gt $correct_number ]]
        then
            echo "Votre estimation est trop haute. Essayez encore."
        else
            echo "Félicitations ! Vous avez deviné le bon nombre de fichiers : $correct_number"
        fi
    done
}

# Appel de la fonction principale
play_game
