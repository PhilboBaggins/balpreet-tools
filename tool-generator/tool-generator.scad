
module tool(length, width, sideWidth, childSpacing)
{
    projection()
    {
        difference()
        {
            hull()
            {
                // Straight edge that the slots are cut into
                cube([length, 1, 1]);

                // Rounded corners on the other side (where you hold the tool)
                translate([         width/2, width*0.5]) cylinder(h=1, r=width/2, $fn=20);
                translate([length - width/2, width*0.5]) cylinder(h=1, r=width/2, $fn=20);
            }

            // Finger slot
            hull()
            {
                translate([         width/2, width*0.5]) cylinder(h=3, r=width/4, $fn=0);
                translate([length - width/2, width*0.5]) cylinder(h=3, r=width/4, $fn=0);
            }
        }
    }

    // Tooth
    for (i = [0 : $children - 1])
    {
        translate([sideWidth + (i * childSpacing), 0])
        children(i);
    }
}

module toothRect(x, y)
{
    translate([0, -y])
    square([x, y]);
}

module toothCircle(diameter)
{
    translate([diameter / 2, 0])
    circle(r = diameter / 2);
}

module toothHex(diameter)
{
    translate([diameter / 2, 0])
    circle(r = diameter / 2, $fn=6);
}

// // Circle
// tool(100, 40, 5, 20)
// {
//     toothCircle(10);
//     toothCircle(10);
//     toothCircle(10);
//     toothCircle(10);
//     toothCircle(10);
// }

// // Hex
// tool(100, 40, 5, 20)
// {
//     toothHex(10);
//     toothHex(10);
//     toothHex(10);
//     toothHex(10);
//     toothHex(10);
// }

// // Rectangle
// tool(100, 40, 5, 20)
// {
//     toothRect(10, 5);
//     toothRect(10, 5);
//     toothRect(10, 5);
//     toothRect(10, 5);
//     toothRect(10, 5);
// }

// Combination
// tool(100, 40, 5, 20)
// {
//     toothRect(10, 5);
//     toothRect(10, 5);

//     toothCircle(10);
//     toothCircle(10);

//     toothHex(10);
//     toothHex(10);
// }
