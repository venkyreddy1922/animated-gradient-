import SwiftUI


extension UIColor {
    
    /// Basic implementation of color interpolation
    public func interpolate(
        between secondColor: UIColor,
        by percentage: CGFloat
    ) -> Color {
        guard let firstCGColorComponents = self.cgColor.components else { return Color(self) }
        guard let secondCGColorComponents = secondColor.cgColor.components else { return Color(secondColor) }
        
        let firstComponents = rgbaComponents(from: firstCGColorComponents)
        let secondComponents = rgbaComponents(from: secondCGColorComponents)
        
        
        let percentage = min(max(0.0, percentage), 1.0)
        
        self
        percentage
        secondColor
        
        let firstRed = firstComponents.red
        let secondRed = secondComponents.red
        let redDiff: CGFloat = secondRed - firstRed
        let interpolatedRed = firstRed + (redDiff * percentage)
        
        
        let firstGreen = firstComponents.green
        let secondGreen = secondComponents.green
        let greenDiff: CGFloat = secondGreen - firstGreen
        let interpolatedGreen = firstGreen + (greenDiff * percentage)
        
        
        let firstBlue = firstComponents.blue
        let secondBlue = secondComponents.blue
        let blueDiff: CGFloat = secondBlue - firstBlue
        let interpolatedBlue = firstBlue + (blueDiff * percentage)
        
        
        print("Red Diff: \(redDiff)")
        print("Interpolated Red: \(interpolatedRed)")
        
        print("Green Diff: \(greenDiff)")
        print("Interpolated Green: \(interpolatedGreen)")
        
        print("Blue Diff: \(blueDiff)")
        print("Interpolated Blue: \(interpolatedBlue)")
                

        return Color(
            red: Double(interpolatedRed),
            green: Double(interpolatedGreen),
            blue: Double(interpolatedBlue)
        )
    }
}


/// Generates RGBA color component values from an array of
/// `CGColor.components` values.
///
/// This helps account for cases where "Black" and "White" `CGColor`s only have
/// two `component`s (the second value being their `alpha`), while other `CGColor`s
/// have four (representing RGBA).
func rgbaComponents(from cgColorComponents: [CGFloat]) -> (
    red: CGFloat,
    green: CGFloat,
    blue: CGFloat,
    alpha: CGFloat
    ) {
        guard cgColorComponents.count == 4 else {
            return (cgColorComponents[0], cgColorComponents[0], cgColorComponents[0], cgColorComponents[1])
        }
        
        return (cgColorComponents[0], cgColorComponents[1], cgColorComponents[2], cgColorComponents[3])
}
