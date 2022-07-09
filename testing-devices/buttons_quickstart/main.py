#!/usr/bin/env pybricks-micropython
import time

from pybricks.ev3devices import (
    ColorSensor,
    GyroSensor,
    Motor,
    TouchSensor,
    UltrasonicSensor,
)
from pybricks.hubs import EV3Brick
from pybricks.parameters import Port

# declaration
TEST_MOTORS = True
TEST_SENSORS = True


# init
ev3 = EV3Brick()
ev3.speaker.beep()


def test_sensor(sensor):
    start = time.perf_counter()
    while True:
        ev3.screen.clear()

        if isinstance(sensor, TouchSensor):
            ev3.screen.draw_text(2, 100, "btn: " + str(sensor.pressed()))
        elif isinstance(sensor, UltrasonicSensor):
            ev3.screen.draw_text(2, 100, "dist: " + str(sensor.distance()))
        elif isinstance(sensor, ColorSensor):
            ev3.screen.draw_text(2, 100, "Color: " + str(sensor.color()))
        elif isinstance(sensor, GyroSensor):
            ev3.screen.draw_text(2, 100, "angle: " + str(sensor.angle()))

        time.sleep(0.1)
        if abs(time.perf_counter() - start) > 5:
            break


if TEST_MOTORS:
    # devices
    motor_a = Motor(Port.A)
    motor_b = Motor(Port.B)
    motor_c = Motor(Port.C)

    # Run the motor up to 500 degrees per second. To a target angle of 90 degrees.
    motor_a.run_target(500, 90)
    motor_b.run_target(500, 90)
    motor_c.run_target(500, 90)

    ev3.speaker.beep(1000, 500)

if TEST_SENSORS:
    ts = TouchSensor(Port.S1)
    gyro = GyroSensor(Port.S2)
    ultrasonic = UltrasonicSensor(Port.S3)
    color_sensor = ColorSensor(Port.S4)

    test_sensor(ts)
    test_sensor(gyro)
    test_sensor(ultrasonic)
    test_sensor(color_sensor)

    ev3.speaker.beep(1000, 500)
