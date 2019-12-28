# Hand
Game Details: Hand is played with two decks of cards, and the goal of the game is to organize your cards in groups to prepare them for "nzool". Each group must contain a minimum of 3 cards and can be either a same-rank group or a sequential one.

Assume that each card is represented by two characters:

● First one for rank {2,3,4,5,6,7,8,9,10,J,Q,K,A}

● Second one for suit {h -> Hearts, s -> Spades, c -> Clubs, d -> Diamonds, j -> Joker}.

Same-rank groups contain cards of the same rank but of different suits. Examples:

[3h, 3c, 3s] -> Valid

[Ah, Ac, As] -> Valid

[4h, 4c, 4s, 4d] -> Valid

[5h, 5d, 5d, 5s] -> Invalid

[5h, 5c, 5d, 5s, 5c] -> Invalid

Sequential groups contain a sequence of cards (up to 13 cards) of the same suit. Examples:

[3h, 4h, 5h, 6h, 7h] -> Valid

[5h, 4h, 3h] -> Valid

[Qd, Kd, Ad] -> Valid

[Ac, 2c, 3c] -> Valid

[3c, 2c, Ac] -> Valid

[5h, 7h, 6h] -> Invalid

[5h, 7h, 8h] -> Invalid

[Kh, Ah, 2h] -> Invalid

(Note that Ace cards can also act as 1: [A, 2, 3] and [Q, K, A] are both valid sequences.

The game also includes two joker cards: 1j, 2j. Jokers can replace any card in a group. A valid group can contain one or two jokers. Examples:

[3h, 1j, 3c] -> Valid

[1j, 4h, 4s] -> Valid

[1j, 2j, 6h] -> Valid

[Qh, Kh, 1j] -> Valid

[2j, 2h, 3h] -> Valid

[2j, 3h, 5h] -> Invalid

Example Runs:

valid_group(["3h", "1j", "3c"]) -> true

valid_group(["3h", "1j", "3h"]) -> false

valid_group(["2h", "3h"]) -> false

