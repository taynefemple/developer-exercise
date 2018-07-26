Notes on list_app/quotecheetah functionality

- Select category from dropdown to sort quotes by category

- Search quotes in the search bar. Quotes will filter as you type. If you have a category selected, the searchbar will only search within that category. Selecting a different category will reset the search bar.

Notes on blackjack

- Run all tests with ruby tests/run_test.rb

- To begin blackjack simulation: ruby blackjack.rb -- Careful, it's addictive... if you love a good CLI game check out
https://github.com/taynefemple/fortuneTeller

________________________________________________________________________________________________________________

Please complete all of the following exercises.  When you are finished, zip up the exercises and email as an attachment to your hiring facilitator.  Incomplete exercises will not be reviewed.  Do not include your `node_modules` directory.

If you have any questions, feel free to email your hiring facilitator.

## JavaScript/CoffeeScript

### Simple React.js List

For this exercise, you will need to build a simple React.js view to list the
given quotes. Please keep your library usage to the minimum, you can use
[jQuery](https://jquery.com/), [underscore.js](http://underscorejs.org/),
and [React.js](https://reactjs.org/).

You should be able to get started with the `quotes.html` provided but feel free
to use [create-react-app](https://github.com/facebook/create-react-app#create-react-app-)
to bootstrap your application.

You are also welcome to use your own implementation of babel & webpack but is
not required for this exercise.

Please provide the following functionality:

 * Required: Fetch quotes from the source [quotes.json](https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/b191cf3b6ea9cdcca8b363516ff969261398061f/quotes.json) and display the available information in a list-like structure (table/list)
 * Required: Provide client-side pagination (up to 15 quotes per page)
 * Required: Provide a way to filter between game and movie quotes
 * Required: Provide a client-side search that filters by the quote text

## Ruby

### Array extension

Please write a module that gives `where` behavior to an array of hashes. (See
`test.rb` and make it pass, or feel free to convert the tests to your favorite
test framework.)

### Simplified Blackjack

`blackjack.rb` contains initial work on a Blackjack simulation.

Your implementation should satisfy the following use cases and Blackjack rules:

 * As a Player I can get a hand with two cards in it
 * As a Dealer I can get a hand with two cards in it
 * As a Player I can see what card the dealer is showing
 * As a Player I can bust (lose immediately) when I am getting cards
 * As a Player I can blackjack (win immediately) when I am dealt cards (this is a simplification)
 * As a Dealer I can draw cards after the player until I win or lose

**Rules:**

 * Bust - Occurs when all possible hand values are greater than 21 points
 * Blackjack - Occurs when a player or dealer is dealt an ace and a 10-point card
 * Dealer - Stays on 17 or above

Please use your discretion in fixing/adding tests. You are free to use/convert to any testing framework you want.

**Optional:**

 * Simulate a random round of the game (you don't have to write educated player decision logic - it could be just guesses)

 For more information on blackjack, please refer to its [wiki page](http://en.wikipedia.org/wiki/Blackjack).
