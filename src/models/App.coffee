# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  checkForBusting: (hand) ->
    # Check the hand's score
      #  Get the array of scores
        #  Iterate through the scores
            #  If both > 21, then display a 'bust' message
    if @get(hand).scores()[0] > 21 and @get(hand).scores()[1] > 21
      true
    #  Deactivate the 'hit' and 'stand' button
    #  Otherwise, do nothing

  checkPlayer: ->
    if @checkForBusting('playerHand')
      alert("Dealer Wins!")

  stand: ->
    # Flip dealer's hidden card
    @get('dealerHand').models[0].flip()
    # Calculate dealer's and user's scores
    dealerScore = Math.min.apply(null,@get('dealerHand').scores())
    playerScore = Math.min.apply(null,@get('playerHand').scores())

    while dealerScore < 17
      @get('dealerHand').hit()
      dealerScore = Math.min.apply(null,@get('dealerHand').scores())

    if @checkForBusting('dealerHand')
      alert("Player Wins!")
    else
      @didPlayerWin(playerScore, dealerScore)
    # If there's no ace in dealer's hand, no ace in player's hand
    # if !@get('dealerHand').hasAce() and !@get('playerHand').hasAce()
    #   # If dealer's score > 17
    #   if dealerScore[0] >= 17
    #     @didPlayerWin(playerScore[0], dealerScore[0])
    #   else

    # < 17
      # While dealer < 17, dealer hits
      # When dealer > or = 17
        # Compare scores
# If there's ace in dealer's hand, no ace in player's hand
# If there's no ace in dealer's hand, ace in player's hand
# If there's an ace in everybody's hand

  didPlayerWin: (playerscore, dealerscore) ->
# Compare scores
    # If dealer > user, then dealer wins
    if dealerscore > playerscore
      alert("Dealer Wins!")
      true
    # Else if dealer < user, user wins
    else if dealerscore < playerscore
      alert("Player Wins!")
      false
    # Otherwise, tie
    else
      alert("It's a Tie!")
      true




