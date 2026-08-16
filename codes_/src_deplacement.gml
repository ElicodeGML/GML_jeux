// --- PARAMÈTRES DU JUEUR ---
var _vitesse = 4;
var _deplacement_h = 0;
var _deplacement_v = 0;

// --- DÉTECTION DES TOUCHES (Z, Q, S, D ou Flèches) ---
var _droite = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _gauche = keyboard_check(ord("Q")) || keyboard_check(vk_left);
var _bas    = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _haut   = keyboard_check(ord("Z")) || keyboard_check(vk_up);

// --- CALCUL DE LA DIRECTION ---
_deplacement_h = (_droite - _gauche);
_deplacement_v = (_bas - _haut);

// Normalisation pour éviter d'aller plus vite en diagonale
if (_deplacement_h != 0 && _deplacement_v != 0) {
    _deplacement_h *= 0.7071;
    _deplacement_v *= 0.7071;
}

// --- COLLISIONS ET DÉPLACEMENT (Ajuste 'obj_mur' selon tes besoins) ---
// Collision Horizontale
if (place_meeting(x + _deplacement_h * _vitesse, y, obj_mur)) {
    while (!place_meeting(x + sign(_deplacement_h), y, obj_mur)) {
        x += sign(_deplacement_h);
    }
    _deplacement_h = 0;
}
x += _deplacement_h * _vitesse;

// Collision Verticale
if (place_meeting(x, y + _deplacement_v * _vitesse, obj_mur)) {
    while (!place_meeting(x, x, y + sign(_deplacement_v), obj_mur)) {
        y += sign(_deplacement_v);
    }
    _deplacement_v = 0;
}
y += _deplacement_v * _vitesse;