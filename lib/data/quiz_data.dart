import '../models/category.dart';
import '../models/question.dart';

List<Category> categories = [
  Category(
    'Films',
    'assets/images/films.png',
    [
      Question(
          'The movie "Inception" was directed by Christopher Nolan.', true),
      Question(
          'Leonardo DiCaprio won an Oscar for his role in "Titanic".', false),
      Question('The first "Star Wars" movie was released in 1977.', true),
      Question('The character of James Bond was created by Ian Fleming.', true),
      Question(
          'The "Lord of the Rings" trilogy was filmed entirely in New Zealand.',
          true),
      Question('Quentin Tarantino directed "Pulp Fiction".', true),
      Question(
          'The movie "The Shawshank Redemption" is based on a Stephen King novel.',
          true),
      Question(
          'The character Darth Vader reveals he is Luke\'s father in "The Empire Strikes Back".',
          true),
      Question('The movie "Jaws" was directed by Steven Spielberg.', true),
      Question('The "Harry Potter" film series consists of 9 movies.', false),
    ],
  ),
  Category(
    'Technology',
    'assets/images/technologies.png',
    [
      Question(
          'The first successful personal computer was the Apple II, launched in 1977.',
          true),
      Question('Tim Berners-Lee invented the World Wide Web in 1989.', true),
      Question('The programming language \'Python\' was named after the snake.',
          false),
      Question(
          'The first computer virus was released in the early 1980s.', true),
      Question(
          'Bitcoin, the first successful cryptocurrency, was created by Satoshi Nakamoto.',
          true),
      Question(
          'The term "machine learning" was coined in the year 1959 by Arthur Samuel.',
          true),
      Question(
          'ENIAC, completed in 1945, is considered to be the first general-purpose electronic computer.',
          true),
      Question('The original iPhone was released in 2008.', false),
      Question('Google was originally called "BackRub".', true),
      Question(
          'The first video ever uploaded to YouTube was titled "Me at the zoo".',
          true),
    ],
  ),
  Category(
    'History',
    'assets/images/history.png',
    [
      Question('The French Revolution started in 1789.', true),
      Question('The United States gained independence in 1776.', true),
      Question('World War II ended in 1945.', true),
      Question('The Roman Empire fell in 476 AD.', true),
      Question('The Industrial Revolution began in France.', false),
      Question('The Renaissance began in Italy.', true),
      Question('The American Civil War ended in 1865.', true),
      Question('Cleopatra was Greek, not Egyptian.', true),
      Question('The Magna Carta was signed in 1215.', true),
      Question('The Berlin Wall fell in 1991.', false),
    ],
  ),
  Category(
    'Math',
    'assets/images/math.png',
    [
      Question('The square root of 144 is 12.', true),
      Question('Pi is exactly equal to 22/7.', false),
      Question('There are 10 digits in the decimal system.', true),
      Question(
          'The sum of the angles in a triangle is always 180 degrees.', true),
      Question('1 is considered a prime number.', false),
      Question('The Pythagorean theorem is a² + b² = c².', true),
      Question(
          'The number 0 is considered neither positive nor negative.', true),
      Question(
          'In a right-angled triangle, the longest side is called the hypotenuse.',
          true),
      Question('The concept of zero was invented in India.', true),
      Question('2^3 equals 6.', false),
    ],
  ),
  Category(
    'Football',
    'assets/images/football.png',
    [
      Question(
          'A standard football match consists of two 45-minute halves.', true),
      Question('The FIFA World Cup is held every 5 years.', false),
      Question(
          'Lionel Messi has won the Ballon d\'Or award 8 times. He\'s the GOAT',
          true),
      Question('The offside rule was introduced in 1925.', true),
      Question('A penalty kick is taken from a distance of 11 meters.', true),
      Question('Brazil has won the most FIFA World Cup titles.', true),
      Question('The first FIFA World Cup was held in Uruguay.', true),
      Question(
          'A red card in football means the player must leave the field for 10 minutes.',
          false),
      Question(
          'The term "hat-trick" refers to a player scoring three goals in a single game.',
          true),
      Question(
          'The Champions League anthem is based on Handel\'s "Zadok the Priest".',
          true),
    ],
  ),
  Category(
    'Geography',
    'assets/images/geography.png',
    [
      Question('The Nile is the longest river in the world.', true),
      Question('Mount Everest is the highest mountain on Earth.', true),
      Question('Australia is both a country and a continent.', true),
      Question('The Amazon rainforest is located in South America.', true),
      Question('Russia borders 14 countries.', true),
      Question(
          'The Dead Sea is the lowest point on Earth\'s land surface.', true),
      Question(
          'The Great Wall of China is visible from space with the naked eye.',
          false),
      Question('Antarctica is the largest desert in the world.', true),
      Question('There are 7 continents on Earth.', true),
      Question('The Pacific Ocean is the largest ocean on Earth.', true),
    ],
  ),
];
