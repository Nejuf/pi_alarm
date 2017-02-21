#!/usr/bin/env python

# GPIO test
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
#GPIO.setwarnings(False)

mode = 'UNOWN'
if GPIO.getmode() == GPIO.BOARD :
  mode = 'BOARD'
elif GPIO.getmode() == GPIO.BCM :
  mode = 'BCM'

print("Using board mode: {}".format(mode))

pin = 22
GPIO.setup(pin, GPIO.OUT)

print('Ping {} is going HIGH'.format(pin))
GPIO.output(pin,GPIO.HIGH)

raw_input('press enter when done: ')
print('Ping {} is going LOW'.format(pin))
GPIO.output(pin,GPIO.LOW)

# Test Input
pinin = 11
#GPIO.setup(pinin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(pinin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

print("Press button to turn on")
try:
  while True:
    if (GPIO.input(pinin) == 1):
      #print("on")
      GPIO.output(pin, 1)
    else:
      #print("off")
      GPIO.output(pin, 0)
except KeyboardInterrupt:
  GPIO.cleanup();

GPIO.cleanup()
print( "test.py Done")

