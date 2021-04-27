from PIL import Image
import pytesseract
import numpy as np
import cv2
import pyautogui
import time



def checkState():
 
    time.sleep(1)
    image = pyautogui.screenshot(region=(28,42, 22, 13)) #左上座標, 寬高
    im = cv2.cvtColor(np.array(image),
                     cv2.COLOR_RGB2BGR)
    # writing it to the disk using opencv
    cv2.imwrite("test.png", im)
    img = Image.open('test.png')
    pytesseract.pytesseract.tesseract_cmd = r'C:/Program Files (x86)/Tesseract-OCR/tesseract.exe' #執行image to string 之前
    time.sleep(1)
    hp = pytesseract.image_to_string(img, lang='eng', config='--psm 8 --oem 3 -c tessedit_char_whitelist=0123456789/')
    print('當前血量: '+hp)
    logout(int(hp))


def logout(hp):
     if(hp < 70):
        pyautogui.press('esc')
        time.sleep(2)
        pyautogui.click(435,337)
        time.sleep(2)
        pyautogui.click(278,318)
        print('exit')
        exit(0)
