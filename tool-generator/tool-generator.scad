
module tool(length, width, sideWidth, childSpacing=0, include_finger_slot=false)
{
    // Calculate spacing between children if not provided
    childSpacing = childSpacing == 0
        ? (length - (sideWidth * 4)) / ($children - 1)
        : childSpacing;
    //echo("childSpacing = ", childSpacing);

    projection()
    {
        difference()
        {
            if (include_finger_slot)
            {
                hull()
                {
                    // Straight edge that the slots are cut into
                    cube([length, 1, 1]);

                    // Rounded corners on the other side (where you hold the tool)
                    translate([         width/2, width*0.5]) cylinder(h=1, r=width/2, $fn=20);
                    translate([length - width/2, width*0.5]) cylinder(h=1, r=width/2, $fn=20);
                }
            }
            else
            {
                cube([length, width, 1]);
            }

            // Finger slot
            if (include_finger_slot)
            hull()
            {
                translate([         width/2, width*0.5]) cylinder(h=3, r=width/4, $fn=0);
                translate([length - width/2, width*0.5]) cylinder(h=3, r=width/4, $fn=0);
            }
        }
    }

    // Teeth
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
// tool(100, 40, 5, include_finger_slot=true)
// {
//     toothCircle(10);
//     toothCircle(10);
//     toothCircle(10);
//     toothCircle(10);
//     toothCircle(10);
// }

// // Hex
// tool(100, 40, 5, include_finger_slot=true)
// {
//     toothHex(10);
//     toothHex(10);
//     toothHex(10);
//     toothHex(10);
//     toothHex(10);
// }

// // Rectangle
// tool(100, 40, 5, include_finger_slot=true)
// {
//     toothRect(10, 5);
//     toothRect(10, 5);
//     toothRect(10, 5);
//     toothRect(10, 5);
//     toothRect(10, 5);
// }

// // Combination
// tool(100, 40, 5, include_finger_slot=true)
// {
//     toothRect(10, 5);
//     toothRect(10, 5);

//     toothCircle(10);
//     toothCircle(10);

//     toothHex(10);
//     toothHex(10);
// }
