
Blackjack
---

![alt text](https://github.com/ajitsy/blackjack/blob/master/app/assets/images/blackjack_screenshot.png)

Task
---

Created a basic single player black jack game. This was a 2-day team project during my time at [Makers Academy](http://www.makersacademy.com/).

Link to our deployed Blackjack app [here](https://pure-refuge-7844.herokuapp.com/)

##Basic rules

```
Player goes bust if over 21
Picture cards are worth 10 points
Ace is worth 1 or 11
Player is dealt minimum 2 cards
Player can continue to hit until he goes bust
```

Technologies Used
---

- Ruby on Rails
- JavaScript
- JQuery
- HTML
- CSS

Tests
---

```
Game
  Deck
    should respond to #shuffle
    should respond to #deck
    initialises with a deck of cards
    shuffles the deck

Game
  should respond to #deal
  should respond to #hand
  should respond to #winner?
  deals a hand
  lets player decide to hit
  lets player decide to stand
  lets player know if he has won the hand
  lets player know if he has lost the hand
  there is no winner or loser if the hand has not finished

Hand
  should respond to #view
  has a 2 card hand when created
  should respond to #hit with 1 argument
  can hit for an extra card
  should respond to #total
  knows how much its hand is worth
  should respond to #stand
  ends hand when player stands
  raises error if you try to hit when hand has ended
  raises error if you try to hit when you have 21 or are bust

Finished in 0.0665 seconds (files took 9.7 seconds to load)
23 examples, 0 failures
```
