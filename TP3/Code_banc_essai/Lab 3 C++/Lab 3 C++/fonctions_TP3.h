#include <stdint.h>
#include <vector>

// D�finition de type
typedef uint32_t u32;
typedef std::vector<std::vector<u32>> ListeVecteurs;

u32 rotr(u32 n, u32 x)
{
	return (x << (32 - n)) | (x >> n);
}

u32 shr(u32 n, u32 x)
{
	return x >> n;
}

// entree[0] x
// entree[1] y
// entree[2] z
// sortie[0] out
std::vector<u32> ch(std::vector<u32> entree)
{
	// Association des entr�es et sorties
	u32 x = entree[0];
	u32 y = entree[1];
	u32 z = entree[2];
	std::vector<u32> sortie;

	// Calcul de la fonction
	sortie.push_back((x & y) ^ ((~x) & z));

	// Fin de la fonction
	return sortie;
}

// entree[0] x
// entree[1] y
// entree[2] z
// sortie[0] out
std::vector<u32> maj(std::vector<u32> entree)
{
	// Association des entr�es et sorties
	u32 x = entree[0];
	u32 y = entree[1];
	u32 z = entree[2];
	std::vector<u32> sortie;

	// Calcul de la fonction
	sortie.push_back((x & y) ^ (x & z) ^ (y & z));

	// Fin de la fonction
	return sortie;
}

// entree[0] x
// sortie[0] out
std::vector<u32> sigma0(std::vector<u32> entree)
{
	// Association des entr�es et sorties
	u32 x = entree[0];
	std::vector<u32> sortie;

	// Calcul de la fonction
	sortie.push_back(rotr(2, x) ^ rotr(13, x) ^ rotr(22, x));

	// Fin de la fonction
	return sortie;
}

// entree[0] x
// sortie[0] out
std::vector<u32> sigma1(std::vector<u32> entree)
{
	// Association des entr�es et sorties
	u32 x = entree[0];
	std::vector<u32> sortie;

	// Calcul de la fonction
	sortie.push_back(rotr(6, x) ^ rotr(11, x) ^ rotr(25, x));

	// Fin de la fonction
	return sortie;
}

// entree[0] x
// sortie[0] out
std::vector<u32> sigma2(std::vector<u32> entree)
{
	// Association des entr�es et sorties
	u32 x = entree[0];
	std::vector<u32> sortie;

	// Calcul de la fonction
	sortie.push_back(rotr(7, x) ^ rotr(18, x) ^ shr(3, x));

	// Fin de la fonction
	return sortie;
}

// entree[0] x
// sortie[0] out
std::vector<u32> sigma3(std::vector<u32> entree)
{
	// Association des entr�es et sorties
	u32 x = entree[0];
	std::vector<u32> sortie;

	// Calcul de la fonction
	sortie.push_back(rotr(17, x) ^ rotr(19, x) ^ shr(10, x));

	// Fin de la fonction
	return sortie;
}