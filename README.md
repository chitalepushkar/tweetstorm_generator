# Tweetstorm generator
A program that receives a text of arbitrary length and creates a tweetstorm with it.

It's a way to bypass Twitter's blessed 140 chars limit.

It allows you to break down a larger corpus of text into tweets and post them in quick succession, forming a cohesive whole.

Since Twitter can barely count (and monotonically increasing numbers is hard!), the final order in which users will see the sequence might not be the one you posted. Or someone retweeted it, losing context.

In order to keep some sense of narrative and connection you prefix each piece of the corpus with the part that it represents (1/4, then 2/4 then 3/4 then 4/4).

### Prerequisite
Ruby (v 2.6.6)

### Setup
1. Install RVM and ruby: https://rvm.io/rvm/install

2. Clone or copy the tweetstormgenerator.rb file to your local machine.

3. Make the ruby file executable before running it:
```
chmod +x /local_directory/tweetstormgenerator.rb
```
### Usage
Run the ruby script to break down a large tweet into smaller chunks of 140 characters.
In your machine's shell, run the script by appending an input text to it.

```
Input:
/local_directory/tweetstormgenerator.rb  "The quick brown fox jumps over the lazy dog....The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog....The quick brown fox jumps over the lazy dog..."

Output:
1/2The quick brown fox jumps over the lazy dog....The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog.
2/2...The quick brown fox jumps over the lazy dog...
```

We can also output the tweetstorm into a file using standard shell output command:
```
/local_directory/tweetstormgenerator.rb "This is a sample tweetstorm" > tweet_storm_output.txt
```

### Test cases
The following test cases have been covered while developing the script.
1. Tweet with single character:
```
Input:
/local_directory/tweetstormgenerator.rb "H"

Output:
1/1H
```

2. Tweet with exactly 137 characters(Since the remaining 3 characters are reserved for prefixing the **tweet number**, **/** and **number of tweets**
```
Input:
/local_directory/tweetstormgenerator.rb "The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog.."

Output:
1/1The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog..
```

3. Tweet with more than 137 characters:
```
Input:
/local_directory/tweetstormgenerator.rb "The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...he quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog"

Output:
1/3The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog..
2/3.The quick brown fox jumps over the lazy dog...The quick brown fox jumps over the lazy dog...he quick brown fox jumps over the lazy dog..
3/3.The quick brown fox jumps over the lazy dog
```

4. When no tweet is supplied to the script: In this case, an error message is printed suggesting the user to add valid tweet content to the script.
```
Input:
/local_directory/tweetstormgenerator.rb

Output:
Argument missing. Please pass tweet text as an argument
```

5. When tweet containing only whitespaces is supplied to the script: In this case, an error message is printed suggesting the user to add valid tweet content to the script.
```
Input:
/local_directory/tweetstormgenerator.rb "                 "

Output:
Argument missing. Please pass tweet text as an argument.
```

6. Tweet with special characters and emojis:
```
Input:
/local_directory/tweetstormgenerator.rb " At liftoff, the stage’s five F-1 rocket engines ignite and produce 7.5 million pounds of thrust.//// 1111 ^^^^ 2222 — — 3333 clearclear 4444 &&&& 5555 %%%% 6666 ???? 7777😀"

Output:
1/2 At liftoff, the stage’s five F-1 rocket engines ignite and produce 7.5 million pounds of thrust.//// 1111 ^^^^ 2222 — — 3333 clearclear 
2/24444 &&&& 5555 %%%% 6666 ???? 7777😀
```

