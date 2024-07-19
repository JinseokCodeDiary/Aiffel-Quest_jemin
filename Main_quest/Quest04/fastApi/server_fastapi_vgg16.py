# from fastapi import FastAPI, HTTPException
# from pydantic import BaseModel
# import requests
# from io import BytesIO
# from PIL import Image
# import numpy as np
# from tensorflow.keras.applications.vgg16 import VGG16, preprocess_input, decode_predictions
# from tensorflow.keras.preprocessing.image import img_to_array
# from tensorflow.keras.models import load_model
# from fastapi.middleware.cors import CORSMiddleware
# import vgg16_prediction_model

# app = FastAPI()

# # CORS를 위한 미들웨어 설정
# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=["*"],  # 모든 도메인에서의 요청을 허용
#     allow_credentials=True,
#     allow_methods=["*"],  # 모든 HTTP 메소드 허용
#     allow_headers=["*"],  # 모든 헤더 허용
# )

# # Pydantic 모델로 이미지 URL을 받음
# class ImageData(BaseModel):
#     url: str

# # VGG16 모델 로드
# model = vgg16_prediction_model.load_model()

# @app.post("/predict/")
# def predict_image(model, image_data):
#     img = Image.open(BytesIO(image_data))
#     img = img.resize((224, 224))
#     img_array = img_to_array(img)
#     img_array = np.expand_dims(img_array, axis=0)
#     img_array = preprocess_input(img_array)

#     predictions = model.predict(img_array)
#     decoded_predictions = decode_predictions(predictions, top=3)[0]
#     return {"predicted_label": decoded_predictions[0][1], "prediction_score": float(decoded_predictions[0][2])}
# if __name__ == "__main__":
#     import uvicorn
#     uvicorn.run(app, host="127.0.0.1", port=5000)

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import requests
from io import BytesIO
from PIL import Image
import numpy as np
from tensorflow.keras.applications.vgg16 import VGG16, preprocess_input, decode_predictions
from tensorflow.keras.preprocessing.image import img_to_array
from fastapi.middleware.cors import CORSMiddleware
import vgg16_prediction_model
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

model = vgg16_prediction_model.load_model()

@app.post("/predict/")
def predict_image(data: ImageData):
    logging.info(f"Received image URL: {data.url}")
    response = requests.get(data.url)
    if response.status_code == 200:
        logging.info("Image downloaded successfully")
        img = Image.open(BytesIO(response.content))
        img = img.resize((224, 224))
        img_array = img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)
        img_array = preprocess_input(img_array)
        
        predictions = model.predict(img_array)
        decoded_predictions = decode_predictions(predictions, top=3)[0]
        result = {"predicted_label": decoded_predictions[0][1], "prediction_score": float(decoded_predictions[0][2])}
        logging.info(f"Prediction result: {result}")
        return result
    else:
        logging.error("Failed to download image")
        raise HTTPException(status_code=400, detail="Could not retrieve image from URL")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=5000)
