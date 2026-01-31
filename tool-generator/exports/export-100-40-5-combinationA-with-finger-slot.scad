include <../tool-generator.scad>

tool(100, 40, 5, include_finger_slot=true)
{
    toothCircle(10);
    toothRect(10, 5);
    toothHex(10);

    toothCircle(10);
    toothRect(10, 5);
    toothHex(10);
}
