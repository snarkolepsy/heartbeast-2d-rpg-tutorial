/// scr_chance(percentage)
var percent = argument[0]; // between 0 and 1
percent = clamp(percent, 0, 1); // clamp ensures it will be in the given range
return (random(1) < percent);
