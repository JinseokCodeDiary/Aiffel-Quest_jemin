import tensorflow as tf
from tensorflow.keras.applications.xception import preprocess_input
from tensorflow.keras.preprocessing.image import img_to_array, load_img
import numpy as np
import os

def load_model():
    model_path = os.path.expanduser('./xception_flower.keras')
    if not os.path.exists(model_path):
        raise FileNotFoundError(f"Model file not found: {model_path}")
    model = tf.keras.models.load_model(model_path)
    return model

async def predict_image(model, image):
    image = image.resize((299, 299))  # Xception 모델 입력 크기에 맞게 조정
    image_array = img_to_array(image)  # 이미지를 배열로 변환
    image_array = np.expand_dims(image_array, axis=0)  # 데이터 배치 형식으로 변환
    image_array = preprocess_input(image_array)  # Xception에 맞게 입력 데이터 전처리

    prediction = model.predict(image_array)
    return prediction
