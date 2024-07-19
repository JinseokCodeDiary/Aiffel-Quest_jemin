# 예측 모델 함수를 포함하는 모듈
import tensorflow as tf
from tensorflow.keras.applications.vgg16 import preprocess_input
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.imagenet_utils import decode_predictions
from PIL import Image
import numpy as np
import os
from tensorflow.keras.preprocessing.image import img_to_array, load_img
from io import BytesIO

def load_model():
    model_path = os.path.expanduser('./vgg16.h5')
    if not os.path.exists(model_path):
        raise FileNotFoundError(f"Model file not found: {model_path}")
    model = tf.keras.models.load_model(model_path)
    return model

async def predict_image(model, image):
    image = image.resize((224, 224))  # 모델 입력 크기에 맞게 조정
    image_array = img_to_array(image)  # 이미지를 배열로 변환
    image_array = np.expand_dims(image_array, axis=0)  # 데이터 배치 형식으로 변환
    image_array = preprocess_input(image_array)  # VGG16에 맞게 입력 데이터 전처리

    prediction = model.predict(image_array)
    return prediction