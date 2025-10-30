#include <SDL3/SDL.h>
#include <SDL3_ttf/SDL_ttf.h>   // Nécessaire si tu veux du texte (SDL_ttf)

int main(void) {
    SDL_Init(SDL_INIT_VIDEO);
    TTF_Init();

    SDL_Window* fenetre = SDL_CreateWindow("Fenêtre avec Bouton", 800, 600, SDL_WINDOW_OPENGL);
    SDL_Renderer* renderer = SDL_CreateRenderer(fenetre, NULL);


    // Couleurs
    SDL_Color boutonCouleur = {120, 70, 180, 255};     // Violet
    SDL_Color boutonSurvol = {160, 100, 220, 255};     // Violet clair
    SDL_Color texteCouleur = {255, 255, 255, 200};     // Blanc

    // Zone du bouton
    SDL_FRect bouton = {350, 250, 100, 50};

    // Police (assure-toi d’avoir une police dans ton dossier)
    TTF_Font* font = TTF_OpenFont("police.ttf", 20);

    bool running = true;
    SDL_Event e;

    while (running) {
        float mouseX, mouseY;
        SDL_GetMouseState(&mouseX, &mouseY);
        bool survole = (mouseX >= bouton.x && mouseX <= bouton.x + bouton.w &&
                            mouseY >= bouton.y && mouseY <= bouton.y + bouton.h);

        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_EVENT_QUIT)
                running = false;

            if (e.type == SDL_EVENT_MOUSE_BUTTON_DOWN && survole) {
                running = false; // clic sur le bouton => quitter
            }
        }

        // Fond
        SDL_SetRenderDrawColor(renderer, 30, 30, 30, 255);
        SDL_RenderClear(renderer);

        // Bouton
        if (survole)
            SDL_SetRenderDrawColor(renderer, boutonSurvol.r, boutonSurvol.g, boutonSurvol.b, 255);
        else
            SDL_SetRenderDrawColor(renderer, boutonCouleur.r, boutonCouleur.g, boutonCouleur.b, 255);
        SDL_RenderFillRect(renderer, &bouton);

        // Texte "Quitter"
        if (font) {
            SDL_Surface* surfaceTexte = TTF_RenderText_Solid(font, "Quitter", strlen("Quitter"), texteCouleur);
            SDL_Texture* textureTexte = SDL_CreateTextureFromSurface(renderer, surfaceTexte);

            float tw, th;
            SDL_GetTextureSize(textureTexte, &tw, &th);
            SDL_FRect textePos = { bouton.x + (bouton.w - tw)/2, bouton.y + (bouton.h - th)/2, tw, th };
            SDL_RenderTexture(renderer, textureTexte, NULL, &textePos);

            SDL_DestroyTexture(textureTexte);
            SDL_DestroySurface(surfaceTexte);
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    }

    // Nettoyage
    TTF_CloseFont(font);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(fenetre);

    running = true;
    SDL_Window* fenetre2 = SDL_CreateWindow("fenetre 2",500,500, SDL_WINDOW_OPENGL);
    SDL_Renderer* renderer2 = SDL_CreateRenderer(fenetre2,NULL);
    while (running) {
        while (SDL_PollEvent(&e)) {
            if (e.type == SDL_EVENT_QUIT)
                running = false;
        }
    }

    SDL_DestroyRenderer(renderer2);
    SDL_DestroyWindow(fenetre2);

    TTF_Quit();
    SDL_Quit();
    return 0;
}

