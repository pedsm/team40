# Exam prep

## Coursework 1 Languages and stuff
### Question 1

To define a language we must define two things. First we must define an alphabet in this example $\Sigma = \{3,5,7,9\}$ And the language can be define with the following style $L= \{ w | w \in \Sigma , 1 \leq |w| \leq 2\}$ As we can see here we have the definition of the language as all words composed by the $\Sigma language with the word length delimited by the abs operator between 1 and 2 inclusive.
If we would to enumerate all world in this language we would get something like.

$L = \{3, 5, 7, 9, 33, 35, 37, 39, 53, 55, 57, 59, 73, 75, 77, 79, 93, 95, 97, 99\}$

This goes to show the importance of writing down comprehensive definitions instead of writing down every single possibility for languages such as this one.

For a general language $L_1$ based on an arbitrary alphabet $\Sigma_1 \text{and } 0 \leq m \leq n$

We can calculate the amount of possible words with the following formula.

$$ |L_1| = \frac{|\Sigma_1|^m - |\Sigma_1|^n+1}{1-|\Sigma_1|}$$

As we can see with this formula the number of possible words increases exponentially with the size of our words and even worse when we add letters to our alphabet.

For a simple example assuming the following assuming our previous alphabet of 4 letters and a language with words between $m = 3 and n = 7$

$$ |L_1| = \frac{4^3 - 4^7+1}{1-4}$$
$$ |L_1| = \frac{64 - 65536}{-3}$$
$$ |L_1| = 21824$$

### Question 2
Let's take the following alphabet $\Sigma = \{a,b,c\}$ and $L_1 = \{\epsilon,b,ac\}L_2 = \{a,b,ca\}$

Let's calculate the following languages

$L_3 = L_1 \cup L_2$

$L_3 = \{\epsilon,a,b,ac,ca\}$

$L_4 = L_1\{\epsilon\} (L_2 \cap L_1)$

$L_4 = \{\epsilon,b,c\}\{\epsilon\} \{b\}$

$L_4 = \{\epsilon,b,c\} \{b\}$

$L_4 = \{b,bb,acb\} \{b\}$

$L_5 = L_3 \emptyset L_4$

$L_5 = \emptyset$

### Question 3
This regards a DFA a Deterministic finite automata. A Dfa is a machine that has a deterministic finite state. These contain a series of parameters. 

> A DFA gets its name based on the fact that is deterministic, a word will always yield the same result as it will always start in the same state and one action can only result in one state change. This also means that if we are halfway through the execution of a word, we can backtrack all the previous steps. This is not the same for NFA Non-deterministic Finite automatas as those can have multiple starting states as well as multiple possibilities for the same input in a given state.

DFA A:

$$A = (Q_A = \{0,1,2,3\}),\Sigma,\delta_A,q_0 = 0,F_A =\{1,2\}$$
$$\delta_A = \{((0, a), 1), ((0, b), 2), ((1, a), 0), ((1, b), 3), ((2, a), 3), ((2, b), 0), ((3, a), 2), ((3, b), 1)\}$$

As we can see we have a couple things here. First we have all the state of the machine, followed by the alphabet, the transition function and the accepting states. The Transition function defines how the automata moves based on its current state and the input. Meanwhile the accepting states are all the states in which the automata is allowed to finish operation. This means that if a word is server as input and does not result in one of the accepting states, this means that this word does not belong to our language.

Having this idea of finishing and non finishing states allow us to define a truth table by putting certain words through the system and seeing if the result in the correct states or not.

Here is a small example of some words in this particular DFA.


|Word       |Result |
|-----------|-------|
|$\epsilon$ |false  |
| b         |true   |
| abaab     |true   |
| bababbba  |false  |


## Coursework 2, NFA's and stuff

Given the following NFA over $\Sigma_A = \{a,b,c\}$

![NFA 1](img/nfa.png)

Find the truth table for the following words.

|Word       |Result |
|-----------|-------|
|$\epsilon$ |true   |
| aaa       |true   |
| bbc       |true   |
| cbc       |false  |
| abcacb    |true   |

With subset construction we can assume the possibilities of a NFA instead of the actual states, this means we can construct a new version of the NFA based on possible states. This allows us to have a clearer picture of all possible routes. To do this we first start By defining all our states. Then Putting all the starting states as a single compound state. From then on we put every possible input through and generate a new compound state. This allows for the creation of compound states dynamically Instead of the creation of all permutations of states.

## Quesiton 2
Lets look at some examples of language construction based on some English expressions. Given the following alphabet $\Sigma = \{a,b,c\}$ Using regular expressions.*the fake ones*

1. All words that contain exactly one a
    - (b+c)\*a(b+c)\*
2. All words that contain at least two bs.
    - (a+c)\*b(a+c)\*b(a+b+c)\*
3. All words that contain at most two cs.
    - (a+b)\*($\epsilon$ + c(a+b)\*)($\epsilon$+c(a+b)\*)

Using formal reasoning we can also revert this process given a regular expression we can calculate the matching result of possible words.

$$L((aa+ \epsilon b * \emptyset)(b+c))$$
$$L((aa) \cup (\epsilon b * \emptyset)(b+c))$$
$$(L(aa) \cup L(\epsilon) L(b * )L(b+c))$$
$$(L(a) L(a) \cup L(\epsilon) L(b * )L(b) \cup L(c))$$
$$(L(a) L(a) \cup L(\epsilon) L(b * )L(b) \cup L(c))$$
$$(\{a\},\{a\} \{b,c\})$$
$$(\{a,a\}\{b,c\})$$
$$(\{aab,aac\})$$

Let's construct a NFA to evaluate the following regular expression. ((a+$\epsilon$)(b+c))\*

Yeah I am not doing this one but you know you can do it if you want #glhf

## Pumping lemma for regular languages

//TODO:
