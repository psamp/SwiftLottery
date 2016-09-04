import GameplayKit
typealias Guess = (Int, Int, Int, Int, Int, powerball: Int)

func determineWinnings(winningNumbers: Guess, guess: Guess, jackpot: Int) -> Int {
    var playerWinnings = 0
    let oneTenthOfJackpot = jackpot / 10
    
    if(guess == winningNumbers) {
        playerWinnings = jackpot
    } else {
        let playerGuessedPowerball = guess.powerball == winningNumbers.powerball
        
        if guess.0 == winningNumbers.0 {
            playerWinnings += oneTenthOfJackpot
        }
        
        if guess.1 == winningNumbers.1 {
            playerWinnings += oneTenthOfJackpot
        }
        
        if guess.2 == winningNumbers.2 {
            playerWinnings += oneTenthOfJackpot
        }
        
        if guess.3 == winningNumbers.3 {
            playerWinnings += oneTenthOfJackpot
        }
        
        if guess.4 == winningNumbers.4 {
            playerWinnings += oneTenthOfJackpot
        }
        
        if playerGuessedPowerball {
            let playerOnlyGuessedPowerball = playerWinnings == 0 ? true : false
            
            if !playerOnlyGuessedPowerball {
                playerWinnings *= 2
            } else {
                playerWinnings += oneTenthOfJackpot
            }
            
        }
    }
    
    return playerWinnings
}

func play(guess: Guess) -> Int {
    
    let generator = GKRandomDistribution.init(lowestValue: 0, highestValue: 100)
    
    let jackpot: Int = generator.nextInt() * generator.nextInt() + 10_000
    let winningNumbers = (generator.nextInt(),
                          generator.nextInt(),
                          generator.nextInt(),
                          generator.nextInt(),
                          generator.nextInt(),
                          powerball:generator.nextInt())
    
    return determineWinnings(winningNumbers: winningNumbers, guess: guess, jackpot: jackpot)
}

let guess: Guess = (1, 2, 3, 4, 5, powerball:6)
print("You've won: \(play(guess: guess))");
