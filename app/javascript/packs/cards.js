deck = card_array;
discardDeck = [];
currentCard = null;

document.getElementById("draw-card-button").onclick = drawCard;
updateNumbers();

function updateNumbers() {
    document.getElementById("cards-in-deck").innerHTML = deck.length;
    document.getElementById("cards-discarded").innerHTML = discardDeck.length;
}

function drawCard() {
    if (currentCard != null) {
        discardDeck.push(currentCard);
    }
    
    currentCard = selectRandomCard();
    
    updateNumbers();
    
    if (currentCard != null) {
        document.getElementById("card").src = currentCard;
    } else {
        document.getElementById("card-div").innerHTML = "End of Game";
        document.getElementById("draw-card-button").style.display = "none";
    }
}

    
function selectRandomCard() {
    
    if (deck.length == 0) {
        if (loop === true) {
            deck = discardDeck;
            discardDeck = [];
        } else {
            return null;
        }
    }
    
    var randomIndex = Math.floor(Math.random()*deck.length);
    var card = deck[randomIndex];

    //remove the card just picked from the deck    
    deck.splice( randomIndex, 1 );
    
    return card;
}