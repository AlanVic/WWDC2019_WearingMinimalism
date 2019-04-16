//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, generateClothes())
/*:
 # Minimalism
 
 Minimalism refers to a series of artistic, cultural and scientific movements that have traveled through various moments of the twentieth century and have been concerned with making use of few fundamental elements as a basis for expression.
 
 As you can see, the concept of minimalism is born of art and since then, has been re-echoing its effect in countless other senses. 🖌🖼
 
 Have you ever stopped to about think how the choices influence several people? And how do these choices influence your quality of life?
 
 One of these choices is about what we do with clothes we use and what we do with those we don't.
 
 Many people have plenty of clothes that they do not even use and are kept in the wardrobe without any use. 👕👚
 
 Minimalism has no rules. There is no less minimalism or more. There is no winner, there is no competition. There is well-being. If you have 100 clothes in the closet and use 10, you need to review your drinking habits as it is probably an accumulator. But if you have 100 clothes in the closet and use the 100, congratulations, you know how to enjoy what you have. It is not the quantity, but the use we make of what we have.
 
 Let's find out if there is a certain number or a wrong number of clothes to have.
 
 # Define the life of Alan:
 1. Fill in each variable
 2. Click on "Run My Code"
 3. See what his life would be like
 */
//#-hidden-code
var numbersShirts:Double = 0
var numberPants:Double = 0
var washesPerMonth:Double = 0
//#-end-hidden-code
//How many shirts?
numbersShirts = /*#-editable-code*/<#T##Tap Here##Int#>/*#-end-editable-code*/
//How many pants?
numberPants = /*#-editable-code*/<#T##Tap Here##Int#>/*#-end-editable-code*/
//How often are clothes washed each month?
washesPerMonth = /*#-editable-code*/<#T##Tap Here##Int#>/*#-end-editable-code*/
//#-hidden-code
let check = toCheckLogicMinimalist(numberWashesPerMonth: washesPerMonth, numberOfShirt: numbersShirts, numberTrousers: numberPants)
generateView(scene: check)
//#-end-hidden-code

/*:
 There are 3 cases:
 
 1. Alan needing clothes
 2. Alan with the ideal number of clothes
 3. Alan with too many pieces in his closet
 
 Discover the 3 cases? 🔍 If Yes, Let's go to next page
 
 */
//: [Next: Go to next page!](@next)

