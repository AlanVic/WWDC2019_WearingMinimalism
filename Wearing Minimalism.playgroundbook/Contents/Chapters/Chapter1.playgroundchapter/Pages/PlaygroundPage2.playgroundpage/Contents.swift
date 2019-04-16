//#-hidden-code
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

func generateClothes(){
    proxy?.send(.string("generateClothes"))
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, generateClothes())
//#-end-hidden-code
/*:
 # Combination Clothing
 
 Have you ever thought about how many possible combinations you can make with the same pieces of clothing?
 
 To make these combinations there is the chromatic circle, it helps to create harmonious productions.
 
 See below:
 
  ![nome](colorTheory.png)
 
 ## Guide to the combination:
 ###
 * **Monochrome combination:** The color combination of monochromatic clothing is one in which different shades are used within the same color.
 ###
 * **Combination with analog colors:** The combination with analog colors is when you combine a primary color with its "neighbor" colors to it in the chromatic circle. It is recommended, however, not to mix hot and cold colors in the same composition.
 ###
 * **Complementary colors:** In this type of combination, the association is made with the color that is opposite in the color circle.
 ###
 * **Triad combination:** In the combination of tones in triad it is ugly the association of three colors that have the same distance between them in the chromatic circle. That is, just imagine a triangle in the circle of colors.
 ###
 Once you know how the best combinations are made, view Alan in a way that pleases you! 🥰
 ###
 
 # Help Alan choose clothes for him:
 1. Click on "Tap to enter code",
 2. Select the "generateClothes()" function,
 3. Click on "Run My Code" (as many times as you want).
 4. Tap on the t-shirt or pants and see how was beautiful
*/
//#-editable-code Tap to enter code
//#-end-editable-code
//: [Go to next page!](@next)
