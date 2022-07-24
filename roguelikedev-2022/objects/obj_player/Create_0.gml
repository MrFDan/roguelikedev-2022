// Inherit the parent event
event_inherited();

// Create the FOV object
instance_create_layer(x, y, "Entities", obj_fov);

entity_actions = 2;
entity_current_actions = entity_actions;