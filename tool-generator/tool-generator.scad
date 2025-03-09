
module tool(length, width, numSlots, slotDepth, slotShape)
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

        // Slots
        color("red")
        for (i = [0 : numSlots - 1])
        {
            translate([(i + 0.5) * length / numSlots, 0, 0])
            {
                if (slotShape == "circle")
                {
                    // TODO: How many sides
                    // TODO: The width of the slot is not determined by the length / numSlots ... it probably should be
                    cylinder(h=1, r=slotDepth, $fn=20);
                }
                else if (slotShape == "hex")
                {
                    // TODO: This is not a hexagon, but a circle with 6 sides
                    // TODO: The width of the slot is not determined by the length / numSlots ... it probably should be
                    cylinder(h=1, r=slotDepth, $fn=6);
                }
                else if (slotShape == "square")
                {
                    cube([length / numSlots / 2, slotDepth*2, 10], center=true);
                }
                else
                {
                    echo("Unknown slot shape: ", slotShape);
                }
            }
        }
    }
}

//tool(100, 40, 7, 5, "circle");
//tool(100, 40, 7, 5, "hex");
//tool(100, 40, 7, 5, "square");
//tool(100, 40, 7, 5, "???????????????????????????????????");
