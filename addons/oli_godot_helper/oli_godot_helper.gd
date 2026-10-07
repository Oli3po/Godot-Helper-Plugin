@tool
extends EditorPlugin

const PLUGIN_NAME := "OliLabs Godot Helper"

var prepare_button: Button

func _enter_tree() -> void:
	prepare_button = Button.new()
	prepare_button.text = "Prepare Asset"
	prepare_button.tooltip_text = "Prepare the selected Node3D asset."
	prepare_button.pressed.connect(_on_prepare_asset_pressed)
	add_control_to_container(CONTAINER_TOOLBAR, prepare_button)

func _exit_tree() -> void:
	if is_instance_valid(prepare_button):
		remove_control_from_container(CONTAINER_TOOLBAR, prepare_button)
	prepare_button.queue_free()

func _on_prepare_asset_pressed() -> void:
	var selection := get_editor_interface().get_selection()
	var selected_nodes := selection.get_selected_nodes()

	if selected_nodes.is_empty():
		print("%s: No node selected." % PLUGIN_NAME)
		return

	var selected_node := selected_nodes[0]

	print(
		"%s: Selected node = %s (%s)"
		% [PLUGIN_NAME, selected_node.name, selected_node.get_class()]
	)
