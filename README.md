# SolveSwift

SolveSwift is a simple application that can be useful for iOS developers to pass some challenges frequently encountered at interviews. 

## Installation

Download the archive. Build with XCode and install to your device.

## Usage

Whenever you have a free minute open the app and solve a challenge!

## Contributing

Pull requests are welcome. You can improve UI or add more challenges. To add a challenge or a solution to a challenge just edit the Challenges.json file.
Description of the fields in the Challenges.json:

name - title of a challenge a user will see in the challenges list.
category - category of the challenge. This field can be used for sorting and grouping problems.
question - This is the question the user will read to understand what he is supposed to do to solve the challenge.
edit - this field will pre-populate text editor where the user will solve the problem. Leave it blank if user is supposed to write all the solution himself.
solutions - after the user solves the challenge the solution he printed should be equal to one of the strings in the solutions array. There might be numerous solutions to most of the challenges.
hint - a short text that is supposed to help user solve the problem.

## License

[MIT](https://choosealicense.com/licenses/mit/)
