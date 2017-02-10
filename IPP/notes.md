# Image processing
##Colour spaces

###HSV
Unlike RGB where you take values of colours to define all the colours in your image HSV takes other types of value to be specific:

- Hue (colour wheel position in angle)
- Saturation (Distance of the colour to white)
- Value (Distance of colour to black)

Although HSV is not as widely used as RGB it provides huge benefits for image processing for its characteristics. One common example of HSV usage is when we are looking for specific colours. HSV allows us to target a HUE instead of a range of 3 values we can analyse the hue channel without considering the Saturation and value. This is a much more "human friendly" process because humans are used to see colours and disregard the lighting and shadows that are being applied at all points in time, as colour is consistent throughout different lighting scenarios.

### RGB to HSV
To calculate the conversion you can do the following

\[H = 60 - (G-B)\]
\[S = \frac{Max(RGB) - Min(RGB)}{Max(RGB)}\]
\[V = Max(RGB)\]
