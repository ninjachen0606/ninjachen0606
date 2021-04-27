from pyautogui import press
import time
import pyautogui
import os
import subprocess
import sc
import sys
from PIL import Image
import cv2


pyautogui.FAILSAFE = True
center = 480,380
up = 360,288
down = 579,457
left = 354,479
right = 611,288




countdown(3)
roaming()
attack()


def countdown(y):
    for x in range(3):
        print(y-x)
        time.sleep(1)
    return print('go!')



def roaming():

    while True:
        sc.checkState() #確認當前血量是否健康
        pyautogui.click(down)
        time.sleep(1)
        pyautogui.click(up)
        time.sleep(1)
        isOutside = pyautogui.locateCenterOnScreen(PATH+'outside.png',grayscale=True,confidence=.9) #找尋與outside吻合的照片 
        pyautogui.click(left)
        time.sleep(1)
        pyautogui.click(right)
        time.sleep(1)
        isOutside = pyautogui.locateCenterOnScreen('outside.png',grayscale=True,confidence=.9) 
        if(isOutside == None): #進戰鬥
            print('Fight!!')
            break


def attack():

    while True:

        isGoblin = pyautogui.locateCenterOnScreen('goblin.png', confidence=.65) #哥布靈
        isGoblinBack = pyautogui.locateCenterOnScreen('goblinBack.png', confidence=.65) #哥布靈被偷襲
        isMiniBat = pyautogui.locateCenterOnScreen('miniBat.png', confidence=.65) #小蝙蝠
        #小蝙蝠被偷襲 沒遇到

        if(isGoblin != None):
            pyautogui.click(isGoblin, clicks=2, interval=0.8) #點擊(攻擊)歌布靈座標
            print('attack goblin')
        elif(isGoblinBack != None):
            pyautogui.click(isGoblinBack, clicks=2, interval=0.8) 
            print('attack goblin')
        elif(isMiniBat != None):
            pyautogui.click(isMiniBat, clicks=2, interval=0.8) #點擊(攻擊)小蝙蝠座標
            print('attack miniBat')
        else:
            isOutside = pyautogui.locateCenterOnScreen('outside.png',grayscale=True,confidence=.9)
            print('searching..')
            if(isOutside != None): #找到戰鬥外元素
                roaming()








