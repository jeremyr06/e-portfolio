#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<SDL3/SDL.h>
#include<SDL3/SDL_main.h>
#include<SDL3/SDL_surface.h>
#include<SDL3_image/SDL_image.h>
#include<SDL3_ttf/SDL_ttf.h>


void jeu() {

    /* creation fenetre du jeu */
    SDL_Window* fenetre_jeu = NULL;
    fenetre_jeu = SDL_CreateWindow("Ripert Jérémy's e-portfolio", 1600,
                       900, SDL_WINDOW_OPENGL | SDL_WINDOW_BORDERLESS);
    /* fenetre non redimensionable*/
    SDL_SetWindowResizable(fenetre_jeu, false);
    SDL_SetWindowFullscreen(fenetre_jeu, false);
    /* initialisation du renderer */
    SDL_Renderer *renderer_jeu = NULL;
    renderer_jeu = SDL_CreateRenderer(fenetre_jeu, NULL);


    /* icon du e-portfolio  */
    SDL_Surface* icon = IMG_Load("./Icon_Portfolio.jpg");
    SDL_SetWindowIcon(fenetre_jeu, icon);


    /* creation de la carte */
    SDL_Surface *carte_jeu_surface = IMG_Load("./couloir.jpg");
    SDL_Texture* carte_jeu = NULL;
    carte_jeu = SDL_CreateTextureFromSurface(renderer_jeu, carte_jeu_surface);
    SDL_DestroySurface(carte_jeu_surface);
    /* position et taille de la carte */
    SDL_FRect position_carte_jeu = {0, 0, 1600, 900};


    /* Police d'ecriture */
    TTF_Font* policeBl = TTF_OpenFont("alpine.ttf", 20); //Bouton quitter


    /* Couleurs */
    SDL_Color noir = {0, 0, 0, 255};
    SDL_Color gris = {100, 100, 100, 255};
    SDL_Color blanc = {255, 255, 255, 255};


    /* creation du joueur */
    SDL_Surface *img_joueur = IMG_Load("./joueur.jpg");
    SDL_Texture* joueur = NULL;
    joueur = SDL_CreateTextureFromSurface(renderer_jeu, img_joueur);
    SDL_DestroySurface(img_joueur);
    /* position et taille du joueur */
    SDL_FRect position_joueur = {750, 350, 100, 100};


    /* Boutons */
    // Zone du bouton quitter
    SDL_FRect boutonL = {1500, 0, 100, 50};


    /* creation de l'evenement */
    SDL_Event evenement;


    /* booleen pour dire si le jeu est en cours */
    bool jeu_en_cours = true;


    /* booleens pour savoir dans quelle piece on est */
    bool dans_couloir = true;
    bool dans_bureau = false;
    bool dans_conference = false;
    bool dans_projet = false;
    bool dans_carriere = false;
    bool dans_repos = false;


    /* boucle infini pour faire tourner le jeu */
    while (jeu_en_cours) {


        /* mise a jour de la fenetre*/
        SDL_RenderClear(renderer_jeu);
            /* arriere plan */
            SDL_RenderTexture(renderer_jeu, carte_jeu, NULL, &position_carte_jeu);
            SDL_RenderPresent(renderer_jeu);
            /* joueur */
            SDL_RenderTexture(renderer_jeu, joueur, NULL, &position_joueur);
        SDL_RenderPresent(renderer_jeu);


        /* position souris */
        float mouseX, mouseY;
        SDL_GetMouseState(&mouseX, &mouseY);


        /* survole du bouton leave */
        bool survole_Bl = (mouseX >= boutonL.x && mouseX <= boutonL.x + boutonL.w &&
                mouseY >= boutonL.y && mouseY <= boutonL.y + boutonL.h);


        /*traitement des evenements*/
        while (SDL_PollEvent(&evenement)) {
            /* event pour quitter */
            /* si on presse la croix de la fenetre*/
            if (evenement.type == SDL_EVENT_QUIT){
                jeu_en_cours = false;
            }
            /* si on appuie sur le bouton quitter */
            if (evenement.type == SDL_EVENT_MOUSE_BUTTON_DOWN && survole_Bl) {
                jeu_en_cours = false; // clic sur le bouton => quitter
            }
            if (evenement.type == SDL_EVENT_MOUSE_BUTTON_DOWN){
                printf("%f\n",mouseX);
                printf("%f\n",mouseY);
            }
            /* touche ECHAP permet de quitter le jeu*/
            if (evenement.key.key == SDLK_ESCAPE){
                jeu_en_cours = false;
            }


            /* mouvement joueur */
            if (evenement.key.key == SDLK_S
                && position_joueur.y < position_carte_jeu.h - 130){
                position_joueur.y += 5;
            }
            if (evenement.key.key == SDLK_D
                && position_joueur.x < position_carte_jeu.w - 130){
                if (dans_couloir && position_joueur.x > 1140) {
                    position_joueur.x -= 5;
                }
                position_joueur.x += 5;
            }
            if (evenement.key.key == SDLK_Z
                && position_joueur.y > 30){
                position_joueur.y -= 5;
            }
            if (evenement.key.key == SDLK_Q
                && position_joueur.x > 30){
                if (dans_couloir && position_joueur.x < 330) {
                    position_joueur.x += 5;
                }
                position_joueur.x -= 5;
            }
        }


        // Bouton
        if (survole_Bl)
            SDL_SetRenderDrawColor(renderer_jeu, gris.r, gris.g, gris.b, 255);
        else
            SDL_SetRenderDrawColor(renderer_jeu, noir.r, noir.g, noir.b, 255);
        SDL_RenderFillRect(renderer_jeu, &boutonL);


        if (policeBl) {
            /* Texte sur le bouton leave*/
            /* variables temporaires utiles pour afficher le texte */
            SDL_Surface* surfaceTexte = TTF_RenderText_Solid(policeBl, "Leave", strlen("Leave"), blanc);
            SDL_Texture* textureTexte = SDL_CreateTextureFromSurface(renderer_jeu, surfaceTexte);
            /* Affichage du texte */
            float tw, th;
            SDL_GetTextureSize(textureTexte, &tw, &th);
            SDL_FRect textePos = { boutonL.x + (boutonL.w - tw)/2, boutonL.y + (boutonL.h - th)/2, tw, th };
            SDL_RenderTexture(renderer_jeu, textureTexte, NULL, &textePos);
        }


        /* Prendre une porte dans le couloir */
        /* porte exit */
        if (690 < position_joueur.x && position_joueur.x < 840
            && position_joueur.y < 40 && dans_couloir){
            jeu_en_cours = false;
        }
        /* porte bureau */
        if (710 < position_joueur.x && position_joueur.x < 840
            && position_joueur.y > 760 && dans_couloir) {
            /* changement de carte (piece) */
            SDL_Surface *carte_jeu_surface = IMG_Load("./bureau.jpg");
            carte_jeu = SDL_CreateTextureFromSurface(renderer_jeu, carte_jeu_surface);
            SDL_DestroySurface(carte_jeu_surface);
            /* mise a jour des booleen */
            dans_couloir = false;
            dans_bureau = true;
            /* mise a jour de la position du joueur */
            position_joueur.y = 60;
        }


        /* Prendre la porte dans le bureau */
        if (680 < position_joueur.x && position_joueur.x < 840
            && position_joueur.y < 40 && dans_bureau){
            /* Changement de carte (piece) */
            SDL_Surface *carte_jeu_surface = IMG_Load("./couloir.jpg");
            carte_jeu = SDL_CreateTextureFromSurface(renderer_jeu, carte_jeu_surface);
            SDL_DestroySurface(carte_jeu_surface);
            /* mise a jour des booleen */
            dans_bureau = false;
            dans_couloir = true;
            /* mise a jour de la position du joueur */
            position_joueur.y = 740;
        }


        /* Prendre la porte dans la salle de conference ou la salle de repos */
        if (475 < position_joueur.y && position_joueur.y < 525
            && position_joueur.x < position_carte_jeu.w - 40 && (dans_conference || dans_repos)){
            /* Changement de carte (piece) */
            SDL_Surface *carte_jeu_surface = IMG_Load("./couloir.jpg");
            carte_jeu = SDL_CreateTextureFromSurface(renderer_jeu, carte_jeu_surface);
            SDL_DestroySurface(carte_jeu_surface);
            /* mise a jour des booleen */
            dans_conference = false;
            dans_repos = false;
            dans_couloir = true;
            /* mise a jour de la position du joueur */
            position_joueur.x = 360;
        }


        /* Prendre la porte dans la salle des projets ou la salle qui parle de ma carriere */
        if (475 < position_joueur.y && position_joueur.y < 525
            && position_joueur.x < 40 && (dans_carriere || dans_projet)){
            /* Changement de carte (piece) */
            SDL_Surface *carte_jeu_surface = IMG_Load("./couloir.jpg");
            carte_jeu = SDL_CreateTextureFromSurface(renderer_jeu, carte_jeu_surface);
            SDL_DestroySurface(carte_jeu_surface);
            /* mise a jour des booleen */
            dans_carriere = false;
            dans_projet = false;
            dans_couloir = true;
            /* mise a jour de la position du joueur */
            position_joueur.x = 1120;
        }


        /* affichage du rendu */
        SDL_RenderPresent(renderer_jeu);
        SDL_Delay(50);


    }


    /* Nettoyer la fenetre du jeu */
    TTF_CloseFont(policeBl);
    SDL_DestroyRenderer(renderer_jeu);
    SDL_DestroyWindow(fenetre_jeu);
}



int main(int argc, char* argv[]) {

    /* booleen qui dit si on lance le jeu */
    bool lancer_jeu = false;


    /* initialisation des video */
    SDL_Init(SDL_INIT_VIDEO);
    /* initialisation des textes affichés */
    TTF_Init();


    /* creation de la fenetre et du renderer */
    SDL_Window *fenetre_menu = NULL;
    /* dimension de la fenetre */
    fenetre_menu = SDL_CreateWindow("Ripert Jérémy's e-Portfolio", 1535,
                            784, SDL_WINDOW_OPENGL | SDL_WINDOW_BORDERLESS);
    /* fenetre non redimensionable */
    SDL_SetWindowResizable(fenetre_menu, false);
    SDL_SetWindowFullscreen(fenetre_menu, false);
    /* initialisation du renderer */
    SDL_Renderer *renderer_menu = NULL;
    renderer_menu = SDL_CreateRenderer(fenetre_menu, NULL);


    /* icon du e-portfolio  */
    SDL_Surface* icon = IMG_Load("./Icon_Portfolio.jpg");
    SDL_SetWindowIcon(fenetre_menu, icon);


    /* creation de l'evenement */
    SDL_Event event;


    /* creation du menu */
    SDL_Surface *menu_surface = IMG_Load("./menu.png");
    SDL_Texture* menu = NULL;
    menu = SDL_CreateTextureFromSurface(renderer_menu, menu_surface);
    SDL_DestroySurface(menu_surface);
    /* position et taille du menu */
    SDL_FRect position_menu = {0, 0, 1535, 784};


    /* Couleurs */
    SDL_Color noir = {0, 0, 0, 255};
    SDL_Color grisFonce = {100, 100, 100, 255};
    SDL_Color blanc = {255, 255, 255, 255};
    SDL_Color grisClair = {220, 220, 220, 255};


    /* Police d'ecriture */
    TTF_Font* policeBq = TTF_OpenFont("alpine.ttf", 20); //Bouton quitter
    TTF_Font* policeBs = TTF_OpenFont("alpine.ttf", 50); //Bouton start


    /* Boutons */
    // Zone du bouton quitter
    SDL_FRect boutonQ = {1435, 0, 100, 50};
    // Zone du bouton start
    SDL_FRect boutonS = {585, 305, 370, 250};


    /* boucle infini pour faire fonctionner le menu */
    bool continuer = true;
    while (continuer){


        /* mise a jour de la fenetre */
        /* arriere plan */
        SDL_RenderClear(renderer_menu);
        SDL_RenderTexture(renderer_menu, menu, NULL, &position_menu);
        SDL_RenderPresent(renderer_menu);


        /* position souris */
        float mouseX, mouseY;
        SDL_GetMouseState(&mouseX, &mouseY);


        /* survole du bouton quitter */
        bool survole_Bq = (mouseX >= boutonQ.x && mouseX <= boutonQ.x + boutonQ.w &&
                mouseY >= boutonQ.y && mouseY <= boutonQ.y + boutonQ.h);


        /* survole du bouton start */
        bool survole_Bs = (mouseX >= boutonS.x && mouseX <= boutonS.x + boutonS.w &&
                mouseY >= boutonS.y && mouseY <= boutonS.y + boutonS.h);


        /*traitement des evenements*/
        while (SDL_PollEvent(&event)) {
            /* si on presse la croix de la fenetre*/
            if (event.type == SDL_EVENT_QUIT){
                continuer = false;
            }
            /* si on appuie sur le bouton quitter */
            if (event.type == SDL_EVENT_MOUSE_BUTTON_DOWN && survole_Bq) {
                continuer = false; // clic sur le bouton => quitter
            }
            /* si on appuie sur le bouton start */
            if (event.type == SDL_EVENT_MOUSE_BUTTON_DOWN && survole_Bs){
                continuer = false;
                lancer_jeu = true;
            }
            /* touche ECHAP permet de quitter le jeu*/
            if (event.key.key == SDLK_ESCAPE){
                continuer = false;
            }
        }


        /* Bouton quitter */
        if (survole_Bq)
            SDL_SetRenderDrawColor(renderer_menu, grisFonce.r, grisFonce.g, grisFonce.b, 255);
        else
            SDL_SetRenderDrawColor(renderer_menu, noir.r, noir.g, noir.b, 255);
        SDL_RenderFillRect(renderer_menu, &boutonQ);


        /* Bouton Start */
        if (survole_Bs)
            SDL_SetRenderDrawColor(renderer_menu, grisClair.r, grisClair.g, grisClair.b, 255);
        else
            SDL_SetRenderDrawColor(renderer_menu, blanc.r, blanc.g, blanc.b, 255);
        SDL_RenderFillRect(renderer_menu, &boutonS);


        /* Texte sur les bouton */
        if (policeBq && policeBs) {
            /* Texte sur le bouton quitter*/
            /* variables temporaires utiles pour afficher le texte */
            SDL_Surface* surfaceTexte = TTF_RenderText_Solid(policeBq, "Leave", strlen("Leave"), blanc);
            SDL_Texture* textureTexte = SDL_CreateTextureFromSurface(renderer_menu, surfaceTexte);
            /* Affichage du texte */
            float tw, th;
            SDL_GetTextureSize(textureTexte, &tw, &th);
            SDL_FRect textePos = { boutonQ.x + (boutonQ.w - tw)/2, boutonQ.y + (boutonQ.h - th)/2, tw, th };
            SDL_RenderTexture(renderer_menu, textureTexte, NULL, &textePos);


            /*Texte sur le bouton Start*/
            /* mise a jour des variable temporaires*/
            surfaceTexte = TTF_RenderText_Solid(policeBs, "Start", strlen("Start"), noir);
            textureTexte = SDL_CreateTextureFromSurface(renderer_menu, surfaceTexte);
            /* Affichage du texte */
            SDL_GetTextureSize(textureTexte, &tw, &th);
            SDL_FRect textePos2 = { boutonS.x + (boutonS.w - tw)/2, boutonS.y + (boutonS.h - th)/2, tw, th };
            SDL_RenderTexture(renderer_menu, textureTexte, NULL, &textePos2);


            /* suppression des variables temporaires */
            SDL_DestroyTexture(textureTexte);
            SDL_DestroySurface(surfaceTexte);
        }


        /* affichage du rendu */
        SDL_RenderPresent(renderer_menu);
        SDL_Delay(80);


    }


    /* on libere le menu */
    TTF_CloseFont(policeBq);
    TTF_CloseFont(policeBs);
    SDL_DestroyRenderer(renderer_menu);
    SDL_DestroyWindow(fenetre_menu);


    if (lancer_jeu) {jeu();}


    /* on quitte SDL et SDL_TTF */
    TTF_Quit();
    SDL_Quit();


    /* fonction main de type int */
    return 0;
}
