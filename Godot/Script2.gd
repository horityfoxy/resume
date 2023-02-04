# Реализация открытия двери, которая заколочена доской
extends RigidBody3D

@export var attachedDoor = Node3D # Для привязки двери к доске

func action_use(itemActive = ""): # Когда игрок выпускает луч, он вызывает определенную функцию (если такова имеется на объекте)
	if itemActive == "scrap": # Когда вызывается функция, то в нее передается название объекта, который в данный момент в руке у игрока
		if self.freeze == true: # Если это лом, а RigidBody3D заморожен, то нужно разморозить RigidBody3D (дать возможность физике воздействовать на объект) и открыть дверь, если такая привязана
			if attachedDoor != null:
				attachedDoor.unattached()
			self.freeze = false
