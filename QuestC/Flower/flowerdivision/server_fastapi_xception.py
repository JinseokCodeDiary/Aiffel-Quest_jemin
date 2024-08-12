from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import requests
from io import BytesIO
from PIL import Image
import numpy as np
from tensorflow.keras.applications.xception import Xception, preprocess_input, decode_predictions
from tensorflow.keras.preprocessing.image import img_to_array
from fastapi.middleware.cors import CORSMiddleware
import xception_prediction_model  # 이름을 xception_prediction_model로 변경
import logging

# 로깅 기본 설정: DEBUG 레벨 설정과 로그 포맷 설정
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ImageData(BaseModel):
    url: str

# Xception 모델 로드
model = xception_prediction_model.load_model()

@app.post("/predict/")
def predict_image(data: ImageData):
    logging.info(f"Received image URL: {data.url}")
    response = requests.get(data.url)
    if response.status_code == 200:
        logging.info("Image downloaded successfully")
        img = Image.open(BytesIO(response.content))
        img = img.resize((299, 299))  # Xception 모델에 맞게 크기 변경
        img_array = img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)
        img_array = preprocess_input(img_array)  # Xception에 맞게 전처리
        
        predictions = model.predict(img_array)
        
        # 클래스 라벨을 직접 정의
        class_labels = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']
        
        # 가장 높은 확률을 가진 클래스를 선택
        predicted_index = np.argmax(predictions[0])
        predicted_label = class_labels[predicted_index]
        prediction_score = float(predictions[0][predicted_index])
        
        result = {"predicted_label": predicted_label, "prediction_score": prediction_score}
        logging.info(f"Prediction result: {result}")
        return result
    else:
        logging.error("Failed to download image")
        raise HTTPException(status_code=400, detail="Could not retrieve image from URL")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=5000)
