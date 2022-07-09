#!/usr/bin/env pybricks-micropython

from pybricks.hubs import EV3Brick
from pybricks.parameters import Button


# Initialize the EV3.
ev3 = EV3Brick()


def wait_for_button(ev3):
    """
    This function shows a picture of the buttons on the EV3 screen.

    Then it waits until you press a button.

    It returns which button was pressed.
    """

    # Show a picture of the buttons on the screen.
    ev3.screen.load_image("buttons.png")

    # Tip: add text or icons to the image to help you
    # remember what each button will do in your program.

    # Wait for a single button to be pressed and save the result.
    pressed = []
    while len(pressed) != 1:
        pressed = ev3.buttons.pressed()
    button = pressed[0]

    # Print which button was pressed
    ev3.screen.draw_text(2, 100, button)

    # Now wait for the button to be released.
    while any(ev3.buttons.pressed()):
        pass

    # Return which button was pressed.
    return button


while True:
    # Show the menu and wait for one button to be selected.
    button = wait_for_button(ev3)

    # Now you can do something, based on which button was pressed.

    # In this demo, we just play a different sound for each button.
    if button == Button.LEFT:
        ev3.speaker.beep(200)
    elif button == Button.RIGHT:
        ev3.speaker.beep(400)
    elif button == Button.UP:
        ev3.speaker.beep(600)
    elif button == Button.DOWN:
        ev3.speaker.beep(800)
    elif button == Button.CENTER:
        ev3.speaker.beep(1000)
